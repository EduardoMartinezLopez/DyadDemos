# RotationalComponents

This is the documentation for the `RotationalComponents` library.  Here you will find the documentation for the various definitions contained in `RotationalComponents`.

Note that this documentation is automatically generated primarily from the doc strings and metadata associated with those definitions.

## Types

  * `PartialAbsoluteSensor` - Base ideal sensor for measuring absolute spline variables with no torque interaction.
  * `PartialCompliant` - Defines a generic compliant rotational connection between two shaft splines.
  * `PartialCompliantWithRelativeStates` - Defines relative angular states for compliant rotational connections.
  * `PartialElementaryOneSplineAndSupport` - A base model for a mechanical component with a primary rotational spline and an interconnected support spline.
  * `PartialElementaryRotationalToTranslational` - Base model defining the mechanical interfaces for transforming rotational motion into translational motion.
  * `PartialElementaryTwoSplinesAndSupport` - A foundational model for a mechanical component with two rotational shaft interfaces and a supporting housing, establishing torque balance.
  * `PartialRelativeSensor` - A foundational partial model for measuring relative kinematic variables between two ideal mechanical splines.
  * `PartialTorque` - Partial model of torque that accelerates the flange.
  * `PartialTwoSplines` - Base component providing two independent spline instances.

## Components

  * `AccelerationSensor` - Measures the absolute angular acceleration of a rotational spline.
  * `AccelerationSource` - Defines the forced angular movement of a spline based on an input acceleration signal.
  * `AngleSensor` - Measures the absolute rotational angle of a connected spline.
  * `Damper` - Models a linear rotational mechanical damping element where torque is proportional to relative angular velocity.
  * `Fixed` - Represents a mechanical rotational element fixed at a specified angle.
  * `IdealGear` - An ideal mechanical gear unit with a fixed housing, connecting two rotational shafts.
  * `IdealGearR2T` - Gearbox transforming rotational into translational motion.
  * `IdealPlanetaryGear` - Ideal planetary gear set with three rotational flanges (sun, ring, carrier).
  * `IdealRollingWheel` - Ideal rolling wheel converting rotational motion to translational motion and vice-versa, without inertia.
  * `Inertia` - A 1D-rotational component with inertia, subject to torques from two splines.
  * `MultiSensor` - Ideal sensor to measure the absolute angular velocity, torque, and power between two splines.
  * `Position` - Defines a forced angular position for a spline relative to its support based on an input signal.
  * `PowerSensor` - Measures the instantaneous rotational power transmitted between two mechanical rotational splines.
  * `PrescribeInitialAcceleration` - Defines an initial angular acceleration for a rotational mechanical spline.
  * `PrescribeInitialEquilibrium` - Sets initial zero angular velocity and zero angular acceleration for a rotational connector.
  * `PrescribeInitialPosition` - Sets a specific initial angular position for a rotational spline connector.
  * `PrescribeInitialVelocity` - Sets a defined initial angular velocity to a rotational mechanical connector.
  * `RackAndPinion` - Models an ideal rack and pinion system, converting rotational motion to translational motion.
  * `RelativeAccelerationSensor` - Ideal sensor that measures the relative angular acceleration between two rotational mechanical splines.
  * `RelativeAngleSensor` - Ideal sensor to measure the relative angle between two splines.
  * `RelativeVelocitySensor` - Ideal sensor for measuring the relative angular velocity between two rotational splines.
  * `SpeedSource` - Forced movement of a spline according to a reference angular velocity signal.
  * `Spring` - Ideal linear rotational spring.
  * `SpringDamper` - Models a linear 1D rotational spring and damper acting in parallel.
  * `TorqueSensor` - Ideal sensor measuring the torque transmitted between two rotational splines.
  * `TorqueSource` - Ideal source applying an externally specified torque to a rotational spline.
  * `VelocitySensor` - Measures the ideal absolute angular velocity of a rotational mechanical flange.

## Tests

  * `TwoInertiasWithDrivingTorque` - A mechanical system of two rotational inertias coupled by a spring and damper, driven by a sinusoidal torque.
