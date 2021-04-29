struct BPPData
    name::String
    capacity::Int64
    weights::Vector{Int64}
end

function loadBPP(instance::Symbol)
    file_name = joinpath(data_path, string(instance) * ".zip")
    if !isfile(file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end
    name = splitext(basename(file_name))[1]

    file = ZipFile.Reader(file_name)
    values = parse.(Int64, split(read(file.files[1], String)))
    return load(values, name)
end

function loadBPP(file_name::String)
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end

    name = splitext(basename(file_name))[1]
    values = parse.(Int64, split(read(file_name, String)))
    return load(values, name)
end

function load(values::Array{Int64}, name::String)
    capacity = values[2]
    weights = values[3:end]
    return BPPData(name, capacity, weights)
end

function Base.show(io::IO, data::BPPData)
    print(io, "BPP Data $(data.name)")
    print(io, " ($(length(data.weights)) elements,")
    print(io, " capacity = $(data.capacity))")
end
