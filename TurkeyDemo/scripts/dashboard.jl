using TurkeyDemo
using ModelingToolkit, DyadInterface

import Roots # rootfinding

@named model = TurkeySphereTest()
res = @time TransientAnalysis(; model, stop = 14400)

using GLMakie

res_obs = Observable{ModelingToolkit.SciMLBase.ODESolution}(rebuild_sol(res));

# begin
fig = Figure()
ax = Axis(fig[1, 1]; 
    xlabel = "Cooking Time (minutes)", 
    ylabel = "Temperature (°F)",
    xscale = Makie.ReversibleScale(x -> x / 60, x -> x * 60)
)

oven_plot = hlines!(
    ax, 350;
    label = "Oven",
    color = Makie.Cycled(3),
    linestyle = :dash
)
edge_plot = lines!(
    ax, res_obs;
    idxs = (ModelingToolkit.t_nounits / 60, model.turkey.T_degF[end]),
    label = "Edge",
    color = Makie.Cycled(2)
)
center_plot = lines!(
    ax, res_obs;
    idxs = (ModelingToolkit.t_nounits / 60, model.turkey.T_degF[1]),
    label = "Center",
    color = Makie.Cycled(1)
)

point_of_cooking = lift(res_obs) do sol
    if sol(sol.t[end]; idxs = model.turkey.T_degF[1]) < 165
        return [Point2f(0.0, 0.0)]
    else
        time_cooked = Roots.find_zero(t -> sol(t; idxs =  model.turkey.T_degF[1]) - 165, extrema(sol.t))
        return [Point2f(time_cooked / 60, sol(time_cooked; idxs = model.turkey.T_degF[1]))]
    end
end

scatter!(ax, point_of_cooking; color = Makie.Cycled(4), markersize = 10, label = "Fully Cooked!")

axislegend(ax)

# Parameter input grid
param_grid = GridLayout(fig[2, 1])

# Default values from TurkeySphereTest
default_T_oven = 450.0
default_M_turkey = 5.0
default_rho_turkey = 1050.0
default_N = 10
default_R_turkey = (3 * default_M_turkey / (4 * π * default_rho_turkey))^(1/3)

# Helper function to validate floating point input
function validate_float(str)
    try
        val = parse(Float64, str)
        return !isnan(val) && !isinf(val)
    catch
        return false
    end
end

# Create labeled textboxes
labels = ["T_oven (K)", "M_turkey (kg)", "ρ_turkey (kg/m³)", "R_turkey (m)"]
defaults = [default_T_oven, default_M_turkey, default_rho_turkey, default_R_turkey]

textboxes = Textbox[]

for (i, (label, default)) in enumerate(zip(labels, defaults))
    Label(param_grid[1, i], label; halign = :center)
    tb = Textbox(param_grid[2, i];
        stored_string = string(round(default; sigdigits=6)),
        validator = validate_float,
        width = 100
    )
    push!(textboxes, tb)
end

fig
# end

textboxes_values = [lift(x -> parse(Float64, x), tb.stored_string) for tb in textboxes]

@mtkcompile model = TurkeySphereTest(
    T_oven = default_T_oven,
    M_turkey = default_M_turkey,
    rho_turkey = default_rho_turkey,
    R_turkey = default_R_turkey,
)
prob = ODEProblem(model, [], (0.0, 14400))


running_plot1 = textlabel!(ax, Point2f(0.5, 0.5); text = "Simulating...", space = :relative, fontsize = 16)
running_plot2 = poly!([Rect2f(0.0, 0.0, 1.0, 1.0)], color = (:gray, 0.5), space = :relative)
translate!(running_plot2, 0, 0, 0)

running_plot1.visible[] = false
running_plot2.visible[] = false

Makie.Observables.onany(textboxes_values...) do vals...

    running_plot1.visible[] = true
    running_plot2.visible[] = true

    sol = @time begin
        newprob = ModelingToolkit.remake(prob; p = [model.T_oven => vals[1], model.M_turkey => vals[2], model.rho_turkey => vals[3], model.R_turkey => vals[4]])
        solve(newprob)
    end

    running_plot1.visible[] = false
    running_plot2.visible[] = false

    res_obs[] = sol
end

fig
