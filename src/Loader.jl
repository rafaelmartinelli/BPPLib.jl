function loadBPP(instance::Symbol)
    return load(instance, :BPP)
end

function loadBPP(file_name::String)
    return load(file_name, :BPP)
end

function loadCSP(instance::Symbol)
    data = load(instance, :BPP)
    return data === nothing ? data : toCSP(data)
end

function loadCSP(file_name::String)
    return load(file_name, :CSP)
end

function load(instance::Symbol, type::Symbol)
    file_name = joinpath(data_path, string(instance) * ".zip")
    if !isfile(file_name)
        println("File $(string(instance)) not found!")
        return nothing
    end
    name = splitext(basename(file_name))[1]

    file = ZipFile.Reader(file_name)
    values = parse.(Int64, split(read(file.files[1], String)))
    return load(values, name, type)
end

function load(file_name::String, type::Symbol)
    if !isfile(file_name)
        println("File $file_name not found!")
        return nothing
    end

    name = splitext(basename(file_name))[1]
    values = parse.(Int64, split(read(file_name, String)))
    return load(values, name, type)
end

function load(values::Array{Int64}, name::String, type::Symbol)
    capacity = values[2]
    if type == :BPP
        weights = values[3:end]
        return BPPData(name, capacity, weights)
    else
        weights = values[3:2:end]
        demands = values[4:2:end]
        return CSPData(name, capacity, weights, demands)
    end
end
