using ModelingToolkit, OrdinaryDiffEqDefault

t_end = 2000

@named full_sys=VehicleCycleTest()


sysRed=structural_simplify(full_sys)
prob=ODEProblem(sysRed, [], (0.0, t_end))

@time sol=solve(prob, OrdinaryDiffEqDefault.Rodas5P(), abstol = 1e-6, reltol = 1e-6, progress=true);

plot(sol, idxs=[sysRed.vehicle_speed_ref.y, sysRed.vehicle.vehicle_speed])
plot(sol, idxs=[sysRed.brake_thermal.disk_mass.T, sysRed.brake_thermal.pad_mass.T])
plot(sol, idxs=[sysRed.driver.throttle, sysRed.driver.brake])
plot(sol, idxs=[sysRed.powertrain.drive.tau, sysRed.brake.shaft.tau])
plot(sol, idxs=[sysRed.brake_thermal.heat_disk.Q, sysRed.brake_thermal.heat_pad.Q])