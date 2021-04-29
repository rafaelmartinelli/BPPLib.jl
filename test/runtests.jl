using BPPLib
using Test

@testset "LoadSymbol" begin
    data = loadBPP(:PM_u010_01)
    @test length(data.weights) == 10
    @test data.capacity == 150
    @test data.name == "PM_u010_01"
end

@testset "ErrorSymbol" begin
    data = loadBPP(:PM_u010_0)
    @test data === nothing
end

@testset "LoadString" begin
    data = loadBPP(joinpath(pkgdir(BPPLib), "test/data/PM_u010_01.txt"))
    @test length(data.weights) == 10
    @test data.capacity == 150
    @test data.name == "PM_u010_01"
end

@testset "ErrorString" begin
    data = loadBPP(joinpath(pkgdir(BPPLib), "test/data/PM_u010_0.txt"))
    @test data === nothing
end

@testset "Show" begin
    data = loadBPP(:PM_u010_01)
    @test_nowarn Base.show(data)
end
