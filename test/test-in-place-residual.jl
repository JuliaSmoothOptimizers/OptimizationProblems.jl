@everywhere function test_in_place_residual(prob::Symbol)
  nlp = make_ad_nlp(prob; use_nls = false)
  @test typeof(nlp) <: ADNLPModels.ADNLPModel
  nls = make_ad_nlp(prob; use_nls = true)
  @test typeof(nls) <: ADNLPModels.ADNLSModel
  return test_in_place_residual(prob, nlp, nls)
end

@everywhere function test_in_place_residual(prob::Symbol, nlp::AbstractNLPModel, nls::AbstractNLSModel)
  @testset "Test in-place residual $prob" begin
    x = nls.meta.x0
    Fx = similar(x, nls.nls_meta.nequ)
    pb = String(prob)
    if VERSION ≥ v"1.7" && !occursin("palmer", pb) && (pb != "watson") # palmer residual allocate
        @allocated residual!(nls, x, Fx)
        @test (@allocated residual!(nls, x, Fx)) == 0
    end
    m = OptimizationProblems.eval(Meta.parse("get_$(prob)_nls_nequ"))()
    @test nls.nls_meta.nequ == m
  end

  @testset "Compare NLS with NLP $prob: x0 and obj are the same." begin
    x0 = nlp.meta.x0
    @test x0 == nls.meta.x0
    nlp_fx = obj(nlp, x0)
    nls_fx = obj(nls, x0)
    are_almost_same = (nlp_fx ≈ nls_fx) | (nlp_fx ≈ 2 * nls_fx)
    if !(are_almost_same)
        @info "$prob : NLS $(nls_fx) ≈ NLP $(nlp_fx)"
    end
    @test are_almost_same
  end
end

nls_name_list = intersect(Symbol.(meta[meta.objtype .== :least_squares, :name]), list_problems_ADNLPProblems)
pmap(test_in_place_residual, nls_name_list)
