# BPPLib.jl

<!-- [![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://rafaelmartinelli.github.io/BPPLib.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://rafaelmartinelli.github.io/BPPLib.jl/dev) -->
[![Build Status](https://github.com/rafaelmartinelli/BPPLib.jl/workflows/CI/badge.svg)](https://github.com/rafaelmartinelli/BPPLib.jl/actions)
[![Coverage](https://codecov.io/gh/rafaelmartinelli/BPPLib.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/rafaelmartinelli/BPPLib.jl)
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

This package reads `.txt` data files in `bpp` format for Bin Packing Problem (BPP) instances and returns `BPPData` type:

```julia
struct BPPData
    name     ::String        # Instance name
    capacity ::Int64         # Bin capacity
    weights  ::Vector{Int64} # Items' weights
end
```

To install:
```julia
] add https://github.com/rafaelmartinelli/BPPLib.jl
```

For example, to load `Falkenauer_u120_00.txt`:
```julia
data = loadBPP("/path/to/instance/Falkenauer_u120_00.txt")
```

You can find the classical BPP instances from the literature in the [BPPLib website](http://or.dei.unibo.it/library/bpplib).

Since there are more than 2000 instances from the literature, this package includes only 50 small randomly generated instances. For example, to load `PM_u010_01.txt`: 
```julia
data = loadBPP(:PM_u010_01)
```
See the [full list](https://github.com/rafaelmartinelli/BPPLib.jl/tree/main/data).

Related links:
- http://or.dei.unibo.it/library/bpplib
- http://people.brunel.ac.uk/~mastjjb/jeb/orlib/binpackinfo.html
- https://www2.wiwi.uni-jena.de/Entscheidung/binpp/index.htm
