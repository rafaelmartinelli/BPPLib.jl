using BPPLib
using Test

@testset "BPPLoadSymbol" begin
    data = loadBPP(:PM_u010_01)
    @test length(data.weights) == 10
    @test data.capacity == 150
    @test data.name == "PM_u010_01"
end

@testset "BPPErrorSymbol" begin
    data = loadBPP(:PM_u010_0)
    @test data === nothing
end

@testset "BPPLoadString" begin
    data = loadBPP(joinpath(pkgdir(BPPLib), "test/data/PM_u010_01.txt"))
    @test length(data.weights) == 10
    @test data.capacity == 150
    @test data.name == "PM_u010_01"
end

@testset "BPPErrorString" begin
    data = loadBPP(joinpath(pkgdir(BPPLib), "test/data/PM_u010_0.txt"))
    @test data === nothing
end

@testset "BPPShow" begin
    data = loadBPP(:PM_u010_01)
    @test_nowarn println(data)
end

@testset "CSPLoadSymbol" begin
    data = loadCSP(:PM_u010_01)
    @test length(data.weights) == 10
    @test length(data.demands) == 10
    @test data.capacity == 150
    @test data.name == "PM_u010_01"
end

@testset "CSPErrorSymbol" begin
    data = loadCSP(:PM_u010_0)
    @test data === nothing
end

@testset "CSPLoadString" begin
    data = loadCSP(joinpath(pkgdir(BPPLib), "test/data/PM_u010_01.txt"))
    @test length(data.weights) == 5
    @test length(data.demands) == 5
    @test data.capacity == 150
    @test data.name == "PM_u010_01"
end

@testset "CSPErrorString" begin
    data = loadCSP(joinpath(pkgdir(BPPLib), "test/data/PM_u010_0.txt"))
    @test data === nothing
end

@testset "CSPShow" begin
    data = loadCSP(:PM_u010_01)
    @test_nowarn println(data)
end

@testset "toBPP" begin
    data = loadCSP(:PM_u010_01)
    data2 = toBPP(data)
    @test length(data2.weights) == 10
    @test data2.capacity == 150
    @test data2.name == "PM_u010_01"
end

@testset "toCSP" begin
    data = loadBPP(:PM_u010_01)
    data2 = toCSP(data)
    @test length(data2.weights) == 10
    @test length(data2.demands) == 10
    @test data2.capacity == 150
    @test data2.name == "PM_u010_01"
end
