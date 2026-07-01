@everywhere function test_scalable(item)
  name = item.name  # Symbol
  @testset "Test scalable problems - problem: $(name)" begin
    nlp = make_nlp(name)
    @test item.nvar == nlp.meta.nvar
    nlp11 = make_nlp(name; n = 13 * ndef)
    n11 = getfield(OptimizationProblems, Symbol(:get_, name, :_nvar))(n = 13 * ndef)
    @test n11 == nlp11.meta.nvar

    # test that the problem is actually scalable
    @test n11 != item.nvar

    # dimension-adjustment warning checks (folded in from test-defined-problems.jl)
    for (n, is_adnlp) in item.warn_checks
      mod = is_adnlp ? ADNLPProblems : PureJuMP
      n_adjusted = getfield(OptimizationProblems, Symbol(:get_, name, :_nvar))(; n = n)
      msg_re = Regex("number of variables adjusted from $(n) to $(n_adjusted)")
      @testset "Adjusted dim warning $name ($(nameof(mod))) n=$n" begin
        @test_logs (:warn, msg_re) getfield(mod, name)(; n = n)
      end
    end
  end
end

names_pb_vars = meta[meta.variable_nvar .== true, [:nvar, :name]]
items = map(eachrow(names_pb_vars)) do row
  prob_name = row[:name]
  prob_sym = Symbol(prob_name)
  get_nvar_func = getfield(OptimizationProblems, Symbol("get_", prob_name, "_nvar"))
  warn_checks = Tuple{Int, Bool}[]
  for n in (50, 100)
    n_adjusted = get_nvar_func(; n = n)
    n_adjusted == n && continue
    for is_adnlp in (true, false)
      mod = is_adnlp ? ADNLPProblems : PureJuMP
      isdefined(mod, prob_sym) || continue
      push!(warn_checks, (n, is_adnlp))
    end
    break
  end
  (name = prob_sym, nvar = row[:nvar], warn_checks = warn_checks)
end
pmap(test_scalable, items)
