using FrictionBrakeDemo
using ModelingToolkit, DyadInterface

@named model = VehicleCycleTest()
res = @time TransientAnalysis(; model, stop = 2000)

using Plots
plot(res, idxs=[model.vehicle_speed_ref.y, model.vehicle.vehicle_speed])
plot(res, idxs=[model.brake_thermal.disk_mass.T, model.brake_thermal.pad_mass.T])
plot(res, idxs=[model.driver.throttle, model.driver.brake])
plot(res, idxs=[model.powertrain.drive.tau, model.brake.shaft.tau])
plot(res, idxs=[model.brake_thermal.heat_disk.Q, model.brake_thermal.heat_pad.Q])

plot(res, idxs = (model.vehicle_speed_ref.y, model.brake_thermal.disk_mass.T))

## Eddie sandbox
import CSV
using DataFrames
city = CSV.read("city_cycle.csv")
td = DyadData.TabularDataset(city)

