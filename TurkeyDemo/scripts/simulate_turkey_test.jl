using TurkeyDemo
using ModelingToolkit, DyadInterface

@named model = TurkeySphereTest()
res = @time TransientAnalysis(; model, stop = 14400)

import Plots
Plots.plot(res, idxs=[model.turkey.T_degF[1]])
Plots.plot(res, idxs=[9/5*(model.T_oven - 273.15) + 32, model.turkey.T_degF[1], 9/5*(model.turkey.surface.T - 273.15) + 32])

