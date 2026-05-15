@everywhere function probe_missing(mod::Module, syms::Vector{Symbol})
  missing = Symbol[]
  for s in syms
    if !isdefined(mod, s)
      push!(missing, s)
    end
  end
  return (pid = myid(), missing = missing)
end

probes = @sync begin
  for pid in workers()
    @async remotecall_fetch(probe_missing, pid, ADNLPProblems, list_problems_ADNLPProblems)
  end
end
@info "ADNLPProblems missing per worker" probes

probes = @sync begin
  for pid in workers()
    @async remotecall_fetch(probe_missing, pid, PureJuMP, list_problems_PureJuMP)
  end
end
@info "PureJuMP missing per worker" probes

@testset "Adjusted dimension warnings" begin
  var_probs = OptimizationProblems.meta[OptimizationProblems.meta.variable_nvar, :name]

  for prob_name in var_probs
    prob_sym = Symbol(prob_name)
    
    get_nvar_func = getfield(OptimizationProblems, Symbol("get_", prob_name, "_nvar"))

    for n in (50, 100)
      n_adjusted = get_nvar_func(; n = n)
      n_adjusted == n && continue  # Skip if no adjustment for this n

      msg_re = Regex("number of variables adjusted from $(n) to $(n_adjusted)")

      for mod in (ADNLPProblems, PureJuMP)
        isdefined(mod, prob_sym) || continue
        constructor = getfield(mod, prob_sym)
        @test_logs (:warn, msg_re) constructor(; n = n)
      end
      
      break
    end
  end
end

@test setdiff(union(names(ADNLPProblems), list_problems_not_ADNLPProblems), list_problems) ==
      [:ADNLPProblems]
@test setdiff(union(names(PureJuMP), list_problems_not_PureJuMP), list_problems) == [:PureJuMP]
