# Initialization in Dyad

Dyad has two distinct initialization mechanisms.

## initial equations vs guess attributes

Use initial equations for differential state variables. Use guess attributes for algebraic variables.

initial sets the value at t=0 for variables that have der() applied to them:

```dyad
component Integrator
  variable x::Real
  parameter k::Real = 1.0
  
relations
  initial x = 0.0
  der(x) = k
end
```

guess provides starting points for algebraic variables in simultaneous equations:

```dyad
component NPNTransistor
  variable Vbe::Voltage(guess = 0.7)
  variable Ib::Current(guess = 1e-5)
  capacitor = ElectricalComponents.Capacitor()
  
relations
  Vbe = b.v - e.v
  Ib = Is * (exp(Vbe / Vt) - 1.0)
  guess capacitor.i = 0
end
```

## When to use each

States are integrated quantities: charge not current, position not velocity, thermal energy not heat flow. These need initial equations.

Algebraic variables are instantaneous: voltage across a resistor from Ohm's law, current from Kirchhoff's laws, force from equilibrium. These need guess when they form loops.

## Related Documentation

- syntax.md - Complete syntax for initial equations and variable attributes
- enums_and_initialization.md - Conditional initialization with switch-case
- analyses.md - Using analyze_tool to check models before simulation
