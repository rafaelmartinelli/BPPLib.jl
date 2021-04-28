# BPPLib.jl

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://rafaelmartinelli.github.io/BPPLib.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://rafaelmartinelli.github.io/BPPLib.jl/dev)
[![Build Status](https://github.com/rafaelmartinelli/BPPLib.jl/workflows/CI/badge.svg)](https://github.com/rafaelmartinelli/BPPLib.jl/actions)
[![Coverage](https://codecov.io/gh/rafaelmartinelli/BPPLib.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/rafaelmartinelli/BPPLib.jl)

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

All classical BPP instances in the literature are preloaded:

- `Falkenauer`: paper (link)
- `Scholl`: paper (link)
- `Wäscher`: paper (link)
- `Schwerin`: paper (link)
- `Schoenfield`: paper (link)
- `Random`: paper (link)
- `Augmented`: paper (link)
- `GI`: paper (link)

See the [full list](https://github.com/rafaelmartinelli/BPPLib.jl/tree/main/data).

For example, to load `Falkenauer_u120_00.txt`:
```julia
data = loadBPP(:Falkenauer_u120_00)
```

For custom BPP files:
```julia
data = loadBPP("path/to/my/instance.ext")
```

Related links:
- http://or.dei.unibo.it/library/bpplib
- http://people.brunel.ac.uk/~mastjjb/jeb/orlib/binpackinfo.html
- https://www2.wiwi.uni-jena.de/Entscheidung/binpp/index.htm
