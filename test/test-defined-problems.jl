@everywhere function defined_names(mod::Module)
    # Exported only (default) + actually defined. Adjust all=true if you prefer.
    [n for n in names(mod) if isdefined(mod, n)]
end

@everywhere const list_problems =
    intersect(defined_names(ADNLPProblems), defined_names(PureJuMP))

# The problems included should be carefully argumented and issues
# to create them added.
# TODO: tests are limited for JuMP-only problems
@everywhere const list_problems_not_ADNLPProblems = Symbol[]
@everywhere const list_problems_not_PureJuMP = Symbol[]

@everywhere const list_problems_ADNLPProblems =
    setdiff(list_problems, list_problems_not_ADNLPProblems)

@everywhere const list_problems_PureJuMP =
    setdiff(list_problems, list_problems_not_PureJuMP)

@test setdiff(union(names(ADNLPProblems), list_problems_not_ADNLPProblems), list_problems) ==
      [:ADNLPProblems]
@test setdiff(union(names(PureJuMP), list_problems_not_PureJuMP), list_problems) ==
      [:PureJuMP]

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
