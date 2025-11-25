using FrictionBrakeDemo
using ModelingToolkit, DyadInterface

@named model = SimpleVehicleTest_CoastDown()
res = @time TransientAnalysis(; model, stop = 100)

sol = rebuild_sol(res)
sol[model.vehicle.vehicle_speed][end]

using Plots
plot(sol, idxs=[model.vehicle.vehicle_speed])

