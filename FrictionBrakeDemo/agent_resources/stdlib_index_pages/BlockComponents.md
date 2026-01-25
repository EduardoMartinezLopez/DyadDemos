# BlockComponents

This is the documentation for the `BlockComponents` library.  Here you will find the documentation for the various definitions contained in `BlockComponents`.

Note that this documentation is automatically generated primarily from the doc strings and metadata associated with those definitions.

## Types

  * `DyadDataset` - A Native Julia data type used by the interpolation components
  * `RealInterpolator` - Type for variables that are actually functions that map `Real` values to `Real` values
  * `SI2SO` - Partial component definition with two inputs and one output.
  * `SISO` - Single input single output (SISO) base block, a partial component that defines the interface for blocks with one input and one output signal.
  * `SO` - Standard output interface with a single real output connector.
  * `Signal` - Base component for signal generators that output time-varying signals.
  * `SingleVariableController` - Interface for single-variable continuous controllers with setpoint input, measurement input, and control output.

## Components

  * `Add` - Weighted adder that outputs the sum of two scalar inputs with configurable gains.
  * `Add3` - Weighted summation block that adds three scalar inputs with configurable gains.
  * `Constant` - Provides a constant output signal of value k.
  * `ContinuousClock` - Generates a continuous time signal that starts counting from a specified time.
  * `Cosine` - Generates a cosine wave with configurable parameters.
  * `CosineVariableFrequencyAndAmplitude` - Cosine voltage source with variable frequency and amplitude
  * `Derivative` - Filtered derivative approximation with configurable time constant and gain.
  * `Division` - Divides first input by second input.
  * `ExpSine` - Exponentially damped sine wave with configurable amplitude, frequency, and damping.
  * `Feedback` - Computes the difference between a reference input and a feedback input.
  * `FirstOrder` - First-order filter with a single real pole and adjustable gain.
  * `Gain` - Multiplies input signal by a constant gain factor.
  * `Integrator` - Integrates the input signal with optional gain factor.
  * `Interpolation` - Performs interpolation on input values using a specified dataset and interpolation method.
  * `LimPID` - PID controller with limited output, back calculation anti-windup compensation, setpoint weighting and feed-forward
  * `Limiter` - Signal limiter that constrains input values between specified boundaries.
  * `ParameterizedInterpolation` - Performs interpolation of values based on an input signal using externally defined parameters.
  * `Plant` - Second-order linear system for testing control designs.
  * `Product` - Multiplies two input signals and outputs their product.
  * `Pulse` - Periodic pulse generator with configurable amplitude, period, and duty cycle.
  * `Ramp` - Generates a linearly increasing signal from an offset to a target value over a specified duration.
  * `ReverseCausality` - Forces equality between two input signals by computing an implicit output.
  * `SecondOrder` - Second-order filter with configurable gain, bandwidth, and damping ratio.
  * `Sine` - Generates a sine wave signal with configurable parameters.
  * `SineVariableFrequencyAndAmplitude` - Sine voltage source with adjustable frequency and amplitude through external signals.
  * `SlewRateLimiter` - Limits the rate of change of a signal between specified rising and falling rates.
  * `Square` - Square wave generator that alternates between positive and negative values.
  * `Step` - Generates a step signal that transitions from `offset` to `height+offset` at the specified time.
  * `Terminator` - Signal termination block that consumes input signals without further processing.
  * `Triangular` - Triangular waveform generator with configurable amplitude and frequency.

## Tests

  * `Add3Test` - Test the functionality of the Add3 block by connecting three constant inputs.
  * `AddTest` - Adds two constant values to produce a sum of 3.
  * `ContinuousClockTest` - Test that evaluates a continuous clock signal integrated over time.
  * `CosineTest` - Tests the integration of a cosine signal with configurable parameters.
  * `DerivativeIntegratorTerminatorTest` - Test component that demonstrates the chained behavior of differentiation and integration of a sine signal.
  * `DivisionTest` - Division operation that divides a first input by a second input.
  * `ExpSineTest` - Test component that connects an exponentially damped sine wave to an integrator for validation.
  * `FeedbackTest` - Computes the difference between two input signals.
  * `FirstOrderTest` - Test fixture for evaluating first-order system response to constant input.
  * `InterpolationFileTest` - Tests time-based interpolation using data from a CSV file.
  * `InterpolationJuliaHubDatasetTest` - Test time-dependent interpolation of JuliaHub dataset values.
  * `InterpolationTableTest` - Tests interpolation by applying linear interpolation to a dataset of squares.
  * `LimPIDTest` - Test bench for a limited PID controller connected to a plant model with step input.
  * `LimiterTest` - Test harness for the Limiter component that constrains signals to specified bounds.
  * `ProductTest` - Multiplies two constant values together.
  * `PulseTest` - Generates a pulse signal with configurable parameters and integrates it.
  * `RampTest` - Test passing a ramp signal to an integrator for verification purposes.
  * `SecondOrderTest` - Second-order system test with constant input.
  * `SineTest` - Test component that integrates a sine wave with specific parameters.
  * `SlewRateLimiterTest` - Test component that validates SlewRateLimiter behavior with a sinusoidal input.
  * `SquareTest` - Connects a square wave generator to an integrator to test integration of a periodic signal.
  * `StepTest` - Test that validates step response behavior by connecting a step signal to a terminator.
  * `TriangularTest` - A test component that integrates a triangular signal over time.
  * `VariableSinCosTest` - Test component for sine and cosine generators with variable frequency and amplitude inputs.
