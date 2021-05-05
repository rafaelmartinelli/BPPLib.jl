struct CSPData <: BaseData
    name::String
    capacity::Int64
    weights::Vector{Int64}
    demands::Vector{Int64}
end

function Base.show(io::IO, data::CSPData)
    print(io, "CSP Data $(data.name)")
    print(io, " ($(length(data.weights)) elements,")
    print(io, " capacity = $(data.capacity))")
end
