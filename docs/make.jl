using BPPLib
using Documenter

DocMeta.setdocmeta!(BPPLib, :DocTestSetup, :(using BPPLib); recursive=true)

makedocs(;
    modules=[BPPLib],
    authors="Rafael Martinelli",
    repo="https://github.com/rafaelmartinelli/BPPLib.jl/blob/{commit}{path}#{line}",
    sitename="BPPLib.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://rafaelmartinelli.github.io/BPPLib.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/rafaelmartinelli/BPPLib.jl",
)
