using BPPLib
using Test

@testset "LoadSymbol" begin
    data = loadBPP(:Falkenauer_u1000_02)
    @test length(data.weights) == 1000
    @test data.capacity == 150
    @test data.name == "Falkenauer_u1000_02"
end

@testset "ErrorSymbol" begin
    data = loadBPP(:Falkenauer_u1000_0)
    @test data === nothing
end

@testset "LoadString" begin
    data = loadBPP(joinpath(@__DIR__, "../data/Falkenauer_u120_01.txt"))
    @test length(data.weights) == 120
    @test data.capacity == 150
    @test data.name == "Falkenauer_u120_01"
end

@testset "ErrorString" begin
    data = loadBPP(joinpath(@__DIR__, "../data/Falkenauer_u120_0.txt"))
    @test data === nothing
end

@testset "Show" begin
    data = loadBPP(:Falkenauer_u1000_02)
    @test_nowarn Base.show(data)
end
