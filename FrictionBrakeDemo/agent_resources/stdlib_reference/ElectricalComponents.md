# ElectricalComponents

This is the documentation for the `ElectricalComponents` library.  Here you will find the documentation for the various definitions contained in `ElectricalComponents`.

## Types

  * `OnePort` - A base model for two-terminal electrical components, defining voltage and current relationships.
  * `TwoPin` - A base model for two-terminal electrical components, defining voltage relationship.

## Components

  * `Capacitor` - Ideal electrical capacitor.
  * `ChuaCircuit` - Chua's circuit, an electronic circuit known for its chaotic dynamics.
  * `Conductor` - Ideal linear electrical conductor relating current and voltage through its conductance.
  * `CurrentSensor` - Ideal ammeter measuring the electrical current flowing between its two pins.
  * `CurrentSource` - Ideal current source driven by an external signal.
  * `Ground` - Ideal electrical ground connection, providing a zero-voltage reference.
  * `Inductor` - Ideal inductor characterized by its inductance L.
  * `MultiSensor` - Provides combined voltage and current measurements from an electrical circuit.
  * `NonlinearResistor` - A nonlinear resistor with a piecewise-linear current-voltage characteristic, commonly known as Chua's Resistor.
  * `OpAmpDetailed` - A detailed operational amplifier, incorporating input/output characteristics,
  * `ParallelGLC` - Represents an electrical circuit with a conductor, inductor, and capacitor in parallel, driven by a sinusoidal current source.
  * `PotentialSensor` - Measures the electrical potential at a connection point.
  * `PowerSensor` - Measures the instantaneous electrical power flowing through or consumed by a circuit.
  * `Resistor` - Linear electrical resistor following Ohm's Law.
  * `RotationalEMF` - An ideal electromechanical transducer coupling electrical voltage and current to rotational mechanical torque and angular velocity.
  * `SaturatingInductor` - Inductor model exhibiting magnetic saturation.
  * `VoltageSensor` - Measures the electrical potential difference between its two connection terminals.
  * `VoltageSource` - Ideal voltage source whose output voltage is determined by a real input signal and a scaling parameter.

## Analyses

  * `DeSautyTransient`
  * `SimpleRLCTransient`
  * `SimpleSineRLCTransient`

## Examples

  * `DeSauty` - AC bridge circuit for comparing capacitances
  * `ParallelResonance` - `ParallelResonance` models two parallel RLC resonance circuits, each driven by a current source with variable frequency and amplitude.
  * `RLCModel` - An electrical circuit model featuring an inductor in series with a parallel resistor-capacitor combination, driven by a constant voltage source.
  * `SeriesResonance` - Models two series RLC circuits, one driven by a sine voltage and the other by a cosine voltage, where both sources have their frequency controlled by a common ramp input and their amplitude by a common constant input.
  * `SinRLC` - Series RLC circuit driven by a sinusoidal voltage input.

## Tests

  * `AmplifierWithOpAmpDetailed` - Inverting operational amplifier circuit built using a detailed op-amp model.
  * `MultiSensorTest` - A test circuit designed to verify the behavior of a MultiSensor component within
  * `RotationalEMFTest` - A test circuit for a rotational electromechanical transducer (RotationalEMF) driven by a sinusoidal voltage and connected to an inertial load.
  * `SaturatingInductorTest` - Test circuit for a saturating inductor component.
  * `SensorsTest` - A test circuit with a resistor and capacitor in series, driven by a sinusoidal voltage source, instrumented with voltage, current, and power sensors.
