module BPPLib

import Base: show

export BPPData, loadBPP

const data_path = joinpath(pkgdir(BPPLib), "data")

using ZipFile
include("BPPData.jl")

end
