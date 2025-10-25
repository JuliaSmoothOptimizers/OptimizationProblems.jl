@everywhere function probe_missing(mod::Module, syms::Vector{Symbol})
    missing = Symbol[]
    for s in syms
        if !isdefined(mod, s)
            push!(missing, s)
        end
    end
    return (pid = myid(), missing = missing)
end

const list_problems_ADNLPProblems =
    setdiff(list_problems, list_problems_not_ADNLPProblems)
probes = @sync begin
    for pid in workers()
        @async remotecall_fetch(probe_missing, pid, ADNLPProblems, list_problems_ADNLPProblems)
    end
end
@info "ADNLPProblems missing per worker" probes

const list_problems_PureJuMP =
    setdiff(list_problems, list_problems_not_PureJuMP)
probes = @sync begin
    for pid in workers()
        @async remotecall_fetch(probe_missing, pid, PureJuMP, list_problems_PureJuMP)
    end
end
@info "PureJuMP missing per worker" probes

@test setdiff(union(names(ADNLPProblems), list_problems_not_ADNLPProblems), list_problems) ==
      [:ADNLPProblems]
@test setdiff(union(names(PureJuMP), list_problems_not_PureJuMP), list_problems) ==
      [:PureJuMP]
