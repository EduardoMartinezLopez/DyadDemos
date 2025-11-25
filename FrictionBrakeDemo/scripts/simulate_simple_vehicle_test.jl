using ModelingToolkit, OrdinaryDiffEqDefault

t_end = 100

@named full_sys=SimpleVehicleTest_Constant()
@named full_sys=SimpleVehicleTest_CoastDown()


sysRed=structural_simplify(full_sys)
prob=ODEProblem(sysRed, [], (0.0, t_end))

@time sol=solve(prob, OrdinaryDiffEqDefault.Rodas5P(), abstol = 1e-6, reltol = 1e-6, progress=true);

plot(sol, idxs=[sysRed.vehicle.vehicle_speed])

sol[sysRed.vehicle.vehicle_speed][end]
