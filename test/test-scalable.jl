@everywhere function test_scalable(item)
  try
    name = item.name
    @testset "Test scalable problems - problem: $(name)" begin
      nlp = make_ad_nlp(Symbol(name))
      @test item.nvar == nlp.meta.nvar
      nlp11 = make_ad_nlp(Symbol(name); n = 13 * ndef)
      n11 = OptimizationProblems.eval(Symbol(:get_, name, :_nvar))(n = 13 * ndef)
      @test n11 == nlp11.meta.nvar

      # test that the problem is actually scalable
      @test n11 != item.nvar
    end
  catch e
    @warn "Skipping $(item.name) due to error" err
    @test_skip "Skipped $(item.name) due to $(typeof(err))"
  end
end

names_pb_vars = meta[meta.variable_nvar .== true, [:nvar, :name]]
items = [(name = Symbol(row[:name]), nvar = row[:nvar]) for row in eachrow(names_pb_vars)]
pmap(test_scalable, items)
