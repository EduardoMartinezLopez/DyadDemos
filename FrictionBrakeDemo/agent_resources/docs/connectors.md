---
description: List of standard Dyad connectors for various domains and Hydraulic connector
---

## Connectors {#Connectors}

### Standard Connectors

** STANDARD CONNECTORS DO NOT NEED TO BE NAME SPACED WHEN USED BECAUSE THEY ARE PART OF THE BASE DYAD LIBRARY **

- [`BooleanInput`](../stdlib_reference/Dyad/BooleanInput.dyad) - This connector represents a boolean signal as an input to a component

- [`BooleanOutput`](../stdlib_reference/Dyad/BooleanOutput.dyad) - This connector represents a boolean signal as an output from a component

- [`Flange`](../stdlib_reference/Dyad/Flange.dyad) - This connector represents a mechanical flange with position and force as the potential and flow variables, respectively.

- [`IntegerInput`](../stdlib_reference/Dyad/IntegerInput.dyad) - This connector represents an integer signal as an input to a component

- [`IntegerOutput`](../stdlib_reference/Dyad/IntegerOutput.dyad) - This connector represents an integer signal as an output from a component

- [`Node`](../stdlib_reference/Dyad/Node.dyad) - This connector represents a thermal node with temperature and heat flow as the potential and flow variables, respectively.

- [`Pin`](../stdlib_reference/Dyad/Pin.dyad) - This connector represents an electrical pin with voltage and current as the potential and flow variables, respectively.

- [`RealInput`](../stdlib_reference/Dyad/RealInput.dyad) - This connector represents a real signal as an input to a component

- [`RealOutput`](../stdlib_reference/Dyad/RealOutput.dyad) - This connector represents a real signal as an output from a component

- [`Spline`](../stdlib_reference/Dyad/Spline.dyad) - This connector represents a rotational spline with angle and torque as the potential and flow variables, respectively.

### Hydraulic Connector

- [`Port`](../stdlib_reference/HydraulicComponents/Port.dyad) - This connector represents `p` (pressure) as potential and `m_flow` (mass flow) as flow variable. It includes a path variable `medium`.

### Custom Connector

Define custom connectors for custom data types or when your use case isn't covered by the standard connectors.

For allowed variable types and syntax, refer to the [Connector Syntax](syntax.md#syntax-connectors).
