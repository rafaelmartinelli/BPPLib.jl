module BPPLib

import Base: show

export BPPData, loadBPP, toCSP
export CSPData, loadCSP, toBPP

const data_path = joinpath(pkgdir(BPPLib), "data")

using ZipFile

abstract type BaseData end

include("BPPData.jl")
include("CSPData.jl")
include("Util.jl")
include("Loader.jl")

end
