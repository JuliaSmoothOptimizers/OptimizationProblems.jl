@everywhere function test_scalable(pb)
  @testset "problem: $(pb[:name])" begin
    nlp = make_ad_nlp(Symbol(pb[:name]))
    @test pb[:nvar] == nlp.meta.nvar
    nlp11 = make_ad_nlp(Symbol(pb[:name]); n = 13 * ndef)
    n11 = OptimizationProblems.eval(Symbol(:get_, pb[:name], :_nvar))(n = 13 * ndef)
    @test n11 == nlp11.meta.nvar

    # test that the problem is actually scalable
    @test n11 != pb[:nvar]
  end
end

@testset "Test scalable problems" begin
  names_pb_vars = meta[
    meta.variable_nvar .== true,
    [:nvar, :name, :best_known_upper_bound, :best_known_lower_bound],
  ]
  pmap(test_scalable, eachrow(names_pb_vars))
end
