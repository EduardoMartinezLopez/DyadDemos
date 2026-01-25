# TranslationalComponents

This is the documentation for the `TranslationalComponents` library.  Here you will find the documentation for the various definitions contained in `TranslationalComponents`.

Note that this documentation is automatically generated primarily from the doc strings and metadata associated with those definitions.

## Types

  * `PartialAbsoluteSensor` - Base model for an ideal mechanical sensor measuring absolute flange variables by ensuring zero force interaction.
  * `PartialCompliant` - Base model for a 1D translational compliant connection.
  * `PartialCompliantWithRelativeStates` - Base model for a 1D translational compliant connection using relative displacement and relative velocity as states.
  * `PartialRelativeSensor` - Base two-port element for relative sensing, ensuring conservation of flow between its connection points.
  * `PartialRigid` - Models a massless, rigid connection of a defined length between two translational 1D flanges.
  * `PartialTwoFlanges` - Base component representing a one-dimensional mechanical component with two translational connection points (flanges).

## Components

  * `AccelerationSensor` - Ideal sensor measuring the absolute translational acceleration of a flange.
  * `Damper` - Linear translational damper relating force to relative velocity.
  * `Fixed` - Constrains a translational flange to a fixed position.
  * `Force` - An ideal force source that applies equal and opposite forces to two translational mechanical flanges, controlled by an external signal.
  * `ForceSensor` - Ideal sensor measuring the translational force transmitted between two flanges.
  * `Mass` - Represents a sliding mass with inertia, subject to external and gravitational forces.
  * `MultiSensor` - Ideal sensor measuring absolute velocity, transmitted force, and power flow between two mechanical flanges.
  * `Position` - Forced movement of a flange according to a reference position
  * `PositionSensor` - Measures the absolute linear position of a mechanical translational flange.
  * `PowerSensor` - Ideal sensor measuring the translational power flowing through a point.
  * `PrescribeInitialAcceleration` - Defines a specific initial acceleration for a one-dimensional mechanical translational flange.
  * `PrescribeInitialEquilibrium` - Sets the initial velocity and acceleration of a connected flange to zero.
  * `PrescribeInitialPosition` - Sets the initial position of a translational mechanical flange.
  * `PrescribeInitialVelocity` - Sets an initial velocity condition for a translational mechanical flange.
  * `RelativeAccelerationSensor` - Ideal sensor measuring the relative acceleration between two translational flanges.
  * `RelativePositionSensor` - Measures the ideal relative translational position between two mechanical flanges.
  * `RelativeSpeedSensor` - Ideal sensor measuring the relative translational velocity between two mechanical flanges.
  * `SpeedSensor` - Ideal sensor that measures the absolute translational velocity of a mechanical flange.
  * `Spring` - Linear 1D translational spring relating force to displacement via Hooke's Law.
  * `SpringDamper` - Models a linear translational spring and a linear translational damper connected in parallel.

## Tests

  * `MassDamperSpringFixedTest` - A one-dimensional translational mechanical system composed of a mass, spring, and damper connected to a fixed point.
  * `RelativeSensorsTest` - A test rig for sensors measuring relative translational motion between two independently forced masses.
  * `SensorsTest` - Test environment for verifying absolute position, speed, and acceleration sensors monitoring a mass driven by a constant force.
