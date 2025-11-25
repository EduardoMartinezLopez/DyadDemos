# FrictionBrakeDemo

This library provides demo models for a vehicle friction brake system.  
There are individual subsystems for the friction brake and the brake thermal 
model. 

A test model including the braking system integrated with a simple vehicle 
representation is provided in **`VehicleCycleTest.dyad`**.  The cyle provides a repeating 
series of acceleration and braking transients to drive the brake thermal dynamics.  

The script **`simulate_vehicle_cycle_test.jl`** in the `scripts/` folder can be run to execute the
model and plot relevant results.
  
## Getting Started
  
This library was created with the Dyad Studio VS Code extension.  Your Dyad
models should be placed in the `dyad` directory and the files should be
given the `.dyad` extension.  Several such files have already been placed
in there to get you started.  The Dyad compiler will compile the Dyad models
into Julia code and place it in the `generated` folder.  Do not edit the
files in that directory or remove/rename that directory.

A complete tutorial on using Dyad Studio can be found [here](#).  But you
can run the provided example models by doing the following:

1. Run `Julia: Start REPL` from the command palette.

2. Type `]`.  This will take you to the package manager prompt.

3. At the `pkg>` prompt, type `instantiate` (this downloads all the Julia libraries
   you will need, and the very first time you do it it might take a while).

4. From the same `pkg>` prompt, type `test`.  This will test to make sure the models
   are working as expected.  It may also take some time but you should eventually
   see a result that indicates 2 of 2 tests passed.

5. Use the `Backspace`/`Delete` key to return to the normal Julia REPL, it should
   look like this: `julia>`.

6. Type `using FrictionBrakeDemo`.  This will load your model library.

7. Type `BrakeThermalAnalysis_Constant()` to run a simulation of the `BrakeThermalTest_Constant` model.  The first time you run it,
   this might take a few seconds, but each successive time you run it, it should be very fast.

8. To see simulation results type `using Plots` (and answer `y` if asked if you want
   to add it as a dependency).

9. To plot results of the `BrakeThermalAnalysis_Constant` simulation, simply type `plot(BrakeThermalAnalysis_Constant())`.

10. You can plot variations on that simulation using keyword arguments.  For example,
    try `plot(BrakeThermalAnalysis_Constant(stop=1500, Q_disk=8000))`.
