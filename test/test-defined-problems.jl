@everywhere function probe_missing(mod::Module, syms::Vector{Symbol})
  missing = Symbol[]
  for s in syms
    if !isdefined(mod, s)
      push!(missing, s)
    end
  end
  return (pid = myid(), missing = missing)
end

if get(ENV, "JULIA_TEST_DEBUG", "") == "1"
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
end

@everywhere function check_adjusted_dim_warning(item)
  prob_sym, n, is_adnlp = item
  mod = is_adnlp ? ADNLPProblems : PureJuMP
  get_nvar_func = getfield(OptimizationProblems, Symbol("get_", prob_sym, "_nvar"))
  n_adjusted = get_nvar_func(; n = n)
  msg_re = Regex("number of variables adjusted from $(n) to $(n_adjusted)")
  @testset "Adjusted dim warning $prob_sym ($(nameof(mod))) n=$n" begin
    @test_logs (:warn, msg_re) getfield(mod, prob_sym)(; n = n)
  end
end

@testset "Adjusted dimension warnings" begin
  var_probs = OptimizationProblems.meta[OptimizationProblems.meta.variable_nvar, :name]
  work_items = Tuple{Symbol, Int, Bool}[]
  for prob_name in var_probs
    prob_sym = Symbol(prob_name)
    get_nvar_func = getfield(OptimizationProblems, Symbol("get_", prob_name, "_nvar"))
    for n in (50, 100)
      n_adjusted = get_nvar_func(; n = n)
      n_adjusted == n && continue
      for is_adnlp in (true, false)
        mod = is_adnlp ? ADNLPProblems : PureJuMP
        isdefined(mod, prob_sym) || continue
        push!(work_items, (prob_sym, n, is_adnlp))
      end
      break
    end
  end
  pmap(check_adjusted_dim_warning, work_items)
end

@test setdiff(union(names(ADNLPProblems), list_problems_not_ADNLPProblems), list_problems) ==
      [:ADNLPProblems]
@test setdiff(union(names(PureJuMP), list_problems_not_PureJuMP), list_problems) == [:PureJuMP]
