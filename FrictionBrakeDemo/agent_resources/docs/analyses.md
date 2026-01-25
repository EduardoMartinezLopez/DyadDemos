# Dyad Analysis Reference

In Dyad, an analysis is a way to operate on or run a model.
A typical workflow in Dyad is to create a set of components, and then create an
analysis that runs on the entry point to that set of components. It produces a
solution object that provides information about the model, and can be used to
build various visualizations.

The typical user flow is to extend some partial analysis or built-in analysis and provide the model and whatever parameters are necessary in Dyad.

For example, here's how you would create a first order component and then simulate it:

```dyad
"""
Minimal first-order lag block with transfer function k/(sT + 1).
Matches standard BlockComponents.FirstOrder patterns.
"""
component SimpleFirstOrder
  "Output signal port"
  y = RealOutput()
  "State variable representing filtered value"
  variable x::Real
  "Time constant and gain"
  parameter T::Real = 1.0
  parameter k::Real = 1.0
relations
  der(x) = (k - x)/T
  y = x
end

analysis SimpleFirstOrderTransient
  extends TransientAnalysis(stop = 10.0)
  model = SimpleFirstOrder()
end
```

You can also override parameters in the model via the analysis:

```dyad
analysis SimpleFirstOrderTransient
  extends TransientAnalysis(stop = 10.0)
  model = SimpleFirstOrder(T = Tconst, k = 2.0)
  parameter Tconst::Real = 1.0
end
```

The way to run these analyses is to invoke them in Julia.

```julia
using MyLibrary
result = SimpleFirstOrderTransient()
```

You can also pass parameters as keyword arguments to the analysis:
```julia
result = SimpleFirstOrderTransient(Tconst = 2.0)
```

## Accessing Solution Data in Julia

Once you run an analysis, you can access the solution data using symbolic indexing:

```julia
result = MyAnalysis()
sol = result.sol
model = result.spec.model

# Direct component.variable access (recommended)
temperature = sol[model.heat_capacitor.T]
voltage = sol[model.resistor.v]

# Using Symbol with ₊ separator
temperature = sol[Symbol("heat_capacitor₊T")]

# Time points and interpolation
times = sol.t                    # All time points
state_at_50s = sol(50.0)         # Interpolated state at t=50
value_at_50s = sol(50.0)[1]      # First state variable at t=50

# Plotting multiple variables
using Plots
plot(sol.t, sol[model.component1.x], label="Component 1")
plot!(sol.t, sol[model.component2.x], label="Component 2")
```

The solution preserves your model's hierarchical structure, allowing intuitive access to variables using the same component.variable syntax from your Dyad model.

## Related Documentation

For advanced analysis features:

- **[functions.md](functions.md)** - Using Julia functions to compute complex parameter values in analyses
- **[arrays.md](arrays.md)** - Working with arrays of components in analyses
- **[plotting.md](plotting.md)** - Visualizing analysis results

## Built-in Analyses

### TransientAnalysis
**Purpose:** Simulates a system over time, given a component.
Solves initial value problems for differential-algebraic equations to capture dynamic behavior.
- **Required:** `model`, `stop` (end time)
- **Optional:** `start=0`, `alg="auto"`, `abstol=1e-6`, `reltol=1e-3`, `saveat=0`, `dtmax=0`
- **Output:** Time series solution, plots, solution tables.  As a special case, any TransientAnalysis is plottable via `plot(result; attributes...)`.

### SteadyStateAnalysis
**Purpose:** Finds equilibrium where system derivatives equal zero.
Useful for determining operating points and static analysis of systems at rest.
- **Required:** `model`
- **Optional:** `alg="auto"`, `abstol=1e-8`, `reltol=1e-8`
- **Output:** Steady state variable values, DataFrame

## Control Analyses (DyadControlSystems.jl)

### ClosedLoopAnalysis
**Purpose:** Analyzes feedback system frequency/time-domain properties via linearization.
Evaluates stability margins, sensitivity functions, and closed-loop performance characteristics.
- **Required:** `model`, `measurement` (vector), `control_input` (vector)
- **Optional:** `wl=-1`, `wu=-1`, `num_frequencies=300`, `pos_feedback=true`, `duration=-1.0`
- **Output:** Bode plots, disk/classical margins, step responses

### ClosedLoopSensitivityAnalysis
**Purpose:** Computes sensitivity function S=1/(1+PC) to assess robustness.
Determines how sensitive the closed-loop system is to disturbances and model uncertainties.
- **Required:** `model`, `analysis_points` (vector)
- **Optional:** `loop_openings=[]`, `wl=-1.0`, `wu=-1.0`
- **Output:** Sensitivity Bode plot, H∞ norm, phase/gain margin bounds

### LinearAnalysis
**Purpose:** Linearizes model for small-signal frequency/time-domain analysis.
Provides comprehensive linear system analysis including poles, zeros, and frequency response.
- **Required:** `model`, `inputs` (vector), `outputs` (vector)
- **Optional:** `wl=-1`, `wu=-1`, `num_frequencies=3000`, `duration=-1`
- **Output:** Bode/margin/step/root-locus plots, damping/observability reports

### PIDAutotuningAnalysis
**Purpose:** Automatically optimizes PID gains for frequency-domain robustness.
Uses optimization to find controller parameters that satisfy sensitivity constraints while maximizing performance.
- **Required:** `model`, `measurement`, `control_input`, `step_input`, `step_output`, `Ts` (sampling), `duration`, `Ms`, `Mt`, `Mks`
- **Optional:** `ref=0.0`, `disc="tustin"`, `filter_order=2`, `wl`, `wu`
- **Output:** Optimized PID parameters, sensitivity plots, Nyquist plot

## Model Calibration (DyadModelOptimizer.jl)

### CalibrationAnalysis
**Purpose:** Fits model parameters to experimental data via optimization.
Minimizes the difference between simulated and measured outputs to find optimal parameter values.
- **Required:** `model`, `stop`, `data` (DyadDataset), `N_cols`, `depvars_cols`, `depvars_names`, `N_tunables`, `search_space_names`, `search_space_lb`, `search_space_ub`
- **Optional:** `alg="auto"`, `abstol=1e-8`, `reltol=1e-8`, `calibration_alg="SingleShooting"`, `optimizer="auto"`, `optimizer_maxiters=100`
- **Output:** Calibrated parameters, comparison plots, parameter tables

## FMU Generation (DyadFMUGeneration.jl)

### FMUAnalysis
**Purpose:** Builds Functional Mock-up Unit from Dyad model for co-simulation or model exchange.
Creates a binary that implements FMI standard, enabling model exchange with other simulation tools.
- **Required:** `model`, `n_inputs::Integer`, `inputs::Vector{String}`, `n_outputs::Integer`, `outputs::Vector{String}`
- **Optional:** `version = "FMI_2" or "FMI_3"`, `fmu_type "FMI_ME" or "FMI_CS" or "FMI_BOTH"`, `alg` (only for cosimulation)
- **Output:** FMU file (.fmu), compliance report

## Common Parameter Types
- **Time:** Numeric time values
- **String vectors:** Use `["signal1", "signal2"]` format
- **Solver algorithms:** "auto" selects automatically
- **Tolerances:** Absolute (abstol) and relative (reltol) numerical tolerances

## Usage Pattern
```dyad
analysis MyAnalysisName
  extends PackageName.AnalysisType(
    required_param = value,
    optional_param = value
  )
  model = MyModel()
end
```
