using FrictionBrakeDemo
using ModelingToolkit, DyadInterface

@named model = BrakeThermalTest_Constant()

res = @time TransientAnalysis(; model = model, stop = 1800)

sol = rebuild_sol(res)
sol(1800; idxs = model.brake_thermal.disk_mass.T)
sol(1800; idxs = model.brake_thermal.pad_mass.T)

using Plots
plot(res; idxs=[model.brake_thermal.disk_mass.T, model.brake_thermal.pad_mass.T])
