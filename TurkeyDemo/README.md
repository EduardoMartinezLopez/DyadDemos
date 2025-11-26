# TurkeyDemo
  
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

6. Type `using TurkeyDemo`.  This will load your model library.

7. Type `World()` to run a simulation of the `Hello` model.  The first time you run it,
   this might take a few seconds, but each successive time you run it, it should be very fast.

8. To see simulation results type `using Plots` (and answer `y` if asked if you want
   to add it as a dependency).

9. To plot results of the `World` simulation, simply type `plot(World())`.

10. You can plot variations on that simulation using keyword arguments.  For example,
    try `plot(World(stop=20, k=4))`.

## Interactive Dashboard

To launch an interactive turkey cooking simulation dashboard with adjustable parameters:

1. Install [Dyad](https://help.juliahub.com/dyad/dev/installation.html) if you haven't already.

2. Open this folder in a new VS Code window.
3. Run `Julia: Start REPL` from the VS Code command palette.

4. In the Julia REPL, paste the following code and press `Enter`:
   ```julia
   include("scripts/dashboard.jl")
   ```

This opens a GLMakie window showing temperature over time, with textboxes to adjust oven temperature, turkey mass, density, and radius. The simulation re-runs automatically when you change any parameter (this may take a few seconds).
