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

@test setdiff(union(names(ADNLPProblems), list_problems_not_ADNLPProblems), list_problems) ==
      [:ADNLPProblems]
@test setdiff(union(names(PureJuMP), list_problems_not_PureJuMP), list_problems) == [:PureJuMP]
