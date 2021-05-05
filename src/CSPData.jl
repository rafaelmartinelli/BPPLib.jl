struct CSPData <: BaseData
    name::String
    capacity::Int64
    weights::Vector{Int64}
    demands::Vector{Int64}

    lb::Int64
    ub::Int64
end

function Base.show(io::IO, data::CSPData)
    print(io, "CSP Data $(data.name)")
    print(io, " ($(length(data.weights)) elements,")
    print(io, " $(sum(data.demands)) demands,")
    print(io, " capacity = $(data.capacity))")
    if data.ub != typemax(Int64)
        print(io, " [$(data.lb), $(data.ub)]")
    else
        print(io, " [$(data.lb), Inf]")
    end
end
