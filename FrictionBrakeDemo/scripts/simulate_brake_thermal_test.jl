using ModelingToolkit, OrdinaryDiffEqDefault

t_end = 1800

@named full_sys=BrakeThermalTest_Constant()

sysRed=structural_simplify(full_sys)
prob=ODEProblem(sysRed, [], (0.0, t_end))

@time sol=solve(prob, OrdinaryDiffEqDefault.Rodas5P(), abstol = 1e-6, reltol = 1e-6, progress=true);

plot(sol, idxs=[sysRed.brake_thermal.disk_mass.T, sysRed.brake_thermal.pad_mass.T])

sol[sysRed.brake_thermal.disk_mass.T][end]
sol[sysRed.brake_thermal.pad_mass.T][end]