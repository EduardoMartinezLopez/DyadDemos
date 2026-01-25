# Julia API Discovery: The Right Way

When exploring unfamiliar Julia packages, use the REPL to discover APIs interactively. This guide shows idiomatic patterns through practical examples.

## Example: Finding Docs for Revelant Functionality

Suppose you don't know how to simplify an `ODESystem`, here's how to discover the right approach:

```julia
using ModelingToolkit

# Search docs for relevant functionality
apropos("simplify")
# Shows: structural_simplify, simplify, ...

# Read the docstring to understand usage
@doc structural_simplify
# Reveals: structural_simplify(sys) returns a simplified system

# Now use it
simplified_sys = structural_simplify(sys)
```

## Example: Understanding What an Object Contains

You have an object but don't know its structure:

```julia
# Check the type first
typeof(prob)
# ODEProblem{...}

# See what fields it has
fieldnames(typeof(prob))
# (:f, :u0, :tspan, :p, ...)

# Or for a quick overview of everything
dump(prob, maxdepth=2)
```

## Example: Finding Methods That Work With Your Type

You have an `ODEProblem` and want to know what you can do with it:

```julia
using OrdinaryDiffEqDefault

# Find methods that accept this type
methodswith(ODEProblem)
# Lists: solve, remake, ...

# See which specific solve method applies
methods(solve, (ODEProblem,))
```

## Example: Discovering a Package's Interface

You're new to a package and want to survey what's available:

```julia
using DifferentialEquations

# See exported names (the public API)
names(DifferentialEquations)

# Search for something specific
filter(n -> occursin("solve", lowercase(string(n))), names(DifferentialEquations))

# Check where a function comes from
parentmodule(solve)
# DiffEqBase
```

## Example: Finding the Right Constructor

You need to create an object but aren't sure of the signature:

```julia
using ModelingToolkit

# Look up the constructor directly
methods(ODESystem)
# Shows all ways to construct an ODESystem

# Read the docstring for recommended usage
@doc ODESystem
```

## Example: Tracing Method Dispatch

Your code calls `solve` but you want to know exactly which method runs:

```julia
using InteractiveUtils

# See which method gets dispatched
@which solve(prob)
# Shows file location and signature

# View the actual source code
@less solve(prob)
```

## Web Resources

- **Julia docs**: https://docs.julialang.org
- **SciML packages**: https://docs.sciml.ai/[PackageName]/stable/
- **Dyad Registry**: Standard library docs are in `agent_resources`; others at https://help.juliahub.com/dyad/dev/
- **General packages**: https://juliahub.com/ui/Packages/[PackageName]
