# Namespacing Rules for Components and Connectors from Libraries

## Categories:

### 1. Base Dyad Connectors (NO namespace needed)
The following connectors from the Dyad base library are available directly without namespacing:

| Connector | Usage | Description |
|-----------|-------|-------------|
| `Pin` | `p = Pin()` | Electrical connector with voltage/current |
| `Node` | `port = Node()` | Thermal connector with temperature/heat flow |
| `Flange` | `flange = Flange()` | Translational connector with position/force |
| `Spline` | `spline = Spline()` | Rotational connector with phi/tau |
| `RealInput` | `x = RealInput()` | Causal real signal input |
| `RealOutput` | `y = RealOutput()` | Causal real signal output |
| `BooleanInput` | `flag = BooleanInput()` | Causal boolean input |
| `BooleanOutput` | `state = BooleanOutput()` | Causal boolean output |
| `IntegerInput` | `x = IntegerInput()` | Causal integer input |
| `IntegerOutput` | `y = IntegerOutput()` | Causal integer output |

### 2. Library Components and Connectors (namespace REQUIRED)
Components or connectors from the standard library or external libraries **MUST** use their namespace:

```dyad
# ✅ CORRECT - namespace required for library components
resistor = ElectricalComponents.Resistor(R=100)
filter = BlockComponents.FirstOrder(T=0.1)

# ❌ WRONG - will fail to compile
resistor = Resistor(R=100)  # ERROR: Resistor not found
```

### 3. Sublibrary Components and Connectors (namespace REQUIRED)
Components and connectors from sublibraries, when used outside their respective sublibraries, **MUST** use a namespace that fully qualifies all parent libraries up to the root library.

Example: When you use an `Engine` component defined in `Mechanical` sublibrary of `CarComponents` library, outside the `Mechanical` sublibrary:
```
// For
// ✅ CORRECT - fully qualified namespace
engine = CarComponents.Mechanical.Engine()

// ❌ WRONG - will fail to compile
// Missing sublibrary
engine = CarComponents.Engine() // ERROR: Engine not found
// Missing root library
engine = Mechanical.Engine() // ERROR: Mechanical not found
// Missing namespace when outside `Mechanical` sublibrary
engine = Engine() // ERROR: Engine not found
```

## Common Library Namespaces

| Library | Namespace | Example Components |
|---------|-----------|-------------------|
| Block Components | `BlockComponents.` | `FirstOrder`, `Step`, `Ramp`, `PID` |
| Electrical Components | `ElectricalComponents.` | `Resistor`, `Capacitor`, `Inductor`, `OpAmp` |
| Thermal Components | `ThermalComponents.` | `HeatCapacitor`, `ThermalConductor`, `HeatSource` |
| Hydraulic Components | `HydraulicComponents.` | `Pump`, `Valve`, `Tank`, `Pipe` |
| Rotational Components | `RotationalComponents.` | `Inertia`, `Spring`, `Damper`, `Gear` |
| Translational Components | `TranslationalComponents.` | `Mass`, `Spring`, `Damper`, `Force` |

## ✅ CORRECT Examples

```dyad
component ElectricalCircuit
  "Electronic components"
  resistor = ElectricalComponents.Resistor(R=1000)
  capacitor = ElectricalComponents.Capacitor(C=1e-6)
  opamp = ElectricalComponents.OpAmp()

  "Signal processing"
  filter = BlockComponents.FirstOrder(T=0.1, k=1.0)
  step_input = BlockComponents.Step(height=5.0, start_time=1.0)
relations
  # Your equations here
end
```

```dyad
component ThermalSystem
  "Thermal components"
  mass = ThermalComponents.HeatCapacitor(C=1000)
  resistance = ThermalComponents.ThermalConductor(G=10)
  heater = ThermalComponents.HeatSource()
relations
  # Your thermal equations here
end
```

```dyad
component EV
  engine = CarComponents.Mechanical.Engine()
  battery = CarComponents.Batteries.IonBattery()
  wheels = [RotationalComponents.Wheel() for i in 1:4]
relations
  # EV equations
end

## ❌ WRONG Examples (These WILL FAIL)

```dyad
component BrokenCircuit
  resistor = Resistor(R=1000)        # ERROR: Resistor not found
  capacitor = Capacitor(C=1e-6)      # ERROR: Capacitor not found
  filter = FirstOrder(T=0.1)         # ERROR: FirstOrder not found
relations
  # This will never compile!
end
```

## Why This Happens

- **Dyad has NO import statements** - there's no `using` or `import` in component files
- **No global component resolution** - Dyad must know exactly which library provides each component
- **Compilation-time requirement** - the Dyad compiler needs the full path to generate correct Julia code

## Common Compilation Errors

If you forget namespacing, you'll see errors like:
```
ERROR: Component 'Resistor' not found
ERROR: Unknown component 'FirstOrder'
ERROR: Cannot resolve component 'Capacitor'
```


**Solution:** Always add the library namespace before the component name.

## Remember

**EVERY external component needs its namespace. NO EXCEPTIONS.**

- ✅ `BlockComponents.Step`
- ✅ `ElectricalComponents.Resistor`
- ✅ `ThermalComponents.HeatCapacitor`
- ❌ `Step`
- ❌ `Resistor`
- ❌ `HeatCapacitor`

This is the #1 cause of Dyad compilation failures. Always namespace your library components!

## Related Documentation

- **[components.md](components.md)** - Complete guide to working with components
- **[syntax.md](syntax.md)** - Full syntax reference including component declarations
- **[arrays.md](arrays.md)** - Creating arrays of library components
- **[functions.md](functions.md)** - Using external Julia functions (requires manual module editing)