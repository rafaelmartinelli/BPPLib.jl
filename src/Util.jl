function toCSP(data::BPPData)
    weights = [ i for i in unique(data.weights) ]
    demands = [ count(==(i), data.weights) for i in unique(data.weights) ]
    return CSPData(data.name, data.capacity, weights, demands, data.lb, data.ub)
end

function toBPP(data::CSPData)
    weights = []
    for i in 1:length(data.weights)
        weights = vcat(weights, repeat([ data.weights[i] ], data.demands[i]))
    end
    return BPPData(data.name, data.capacity, weights, data.lb, data.ub)
end

function loadBounds(name::String)
    file_name = joinpath(data_path, "Bounds.zip")
    file = ZipFile.Reader(file_name)
    values = split(read(file.files[1], String))

    index = findfirst(isequal(name), values)
    if index !== nothing
        return parse(Int64, values[index + 1]), parse(Int64, values[index + 2])
    else
        return 0, typemax(Int64)
    end
end
