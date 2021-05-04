function toCSP(data::BPPData)
    weights = [ i for i in unique(data.weights) ]
    demands = [ count(==(i), data.weights) for i in unique(data.weights) ]
    return CSPData(data.name, data.capacity, weights, demands)
end

function toBPP(data::CSPData)
    weights = []
    for i in 1:length(data.weights)
        weights = vcat(weights, repeat([ data.weights[i] ], data.demands[i]))
    end
    return BPPData(data.name, data.capacity, weights)
end
