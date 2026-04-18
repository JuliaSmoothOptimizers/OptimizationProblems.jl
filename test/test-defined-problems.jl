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

function _check_adjusted_warning(ctor::Function, expected_msg::AbstractString, expected_nvar::Integer)
  nlp = @test_logs (:warn, expected_msg) ctor()
  @test nlp.meta.nvar == expected_nvar
end

function _check_adjusted_warning(expected_msg::AbstractString, expected_nvar::Integer, ctor::Function)
  _check_adjusted_warning(ctor, expected_msg, expected_nvar)
end

@testset "Adjusted dimension warnings" begin
  _check_adjusted_warning("NZF1: number of variables adjusted from 1 to 26", 26) do
    ADNLPProblems.NZF1(n = 1)
  end
  _check_adjusted_warning("NZF1: number of variables adjusted from 1 to 26", 26) do
    MathOptNLPModel(PureJuMP.NZF1(n = 1))
  end

  _check_adjusted_warning("spmsrtls: number of variables adjusted from 99 to 100", 100) do
    ADNLPProblems.spmsrtls(n = 99)
  end

  _check_adjusted_warning("chainwoo: number of variables adjusted from 1 to 4", 4) do
    ADNLPProblems.chainwoo(n = 1)
  end
  _check_adjusted_warning("chainwoo: number of variables adjusted from 1 to 4", 4) do
    MathOptNLPModel(PureJuMP.chainwoo(n = 1))
  end

  _check_adjusted_warning("catenary: number of variables adjusted from 10 to 9", 9) do
    ADNLPProblems.catenary(n = 10)
  end
  _check_adjusted_warning("catenary: number of variables adjusted from 10 to 9", 9) do
    MathOptNLPModel(PureJuMP.catenary(n = 10))
  end

  _check_adjusted_warning("clplatea: number of variables adjusted from 5 to 9", 9) do
    ADNLPProblems.clplatea(n = 5)
  end
  _check_adjusted_warning("clplatea: number of variables adjusted from 5 to 4", 4) do
    MathOptNLPModel(PureJuMP.clplatea(n = 5))
  end
  _check_adjusted_warning("clplateb: number of variables adjusted from 5 to 9", 9) do
    ADNLPProblems.clplateb(n = 5)
  end
  _check_adjusted_warning("clplateb: number of variables adjusted from 5 to 4", 4) do
    MathOptNLPModel(PureJuMP.clplateb(n = 5))
  end
  _check_adjusted_warning("clplatec: number of variables adjusted from 5 to 9", 9) do
    ADNLPProblems.clplatec(n = 5)
  end
  _check_adjusted_warning("clplatec: number of variables adjusted from 5 to 4", 4) do
    MathOptNLPModel(PureJuMP.clplatec(n = 5))
  end

  _check_adjusted_warning("fminsrf2: number of variables adjusted from 1 to 4", 4) do
    ADNLPProblems.fminsrf2(n = 1)
  end
  _check_adjusted_warning("fminsrf2: number of variables adjusted from 1 to 4", 4) do
    MathOptNLPModel(PureJuMP.fminsrf2(n = 1))
  end

  _check_adjusted_warning("powellsg: number of variables adjusted from 1 to 4", 4) do
    ADNLPProblems.powellsg(n = 1)
  end
  _check_adjusted_warning("powellsg: number of variables adjusted from 1 to 4", 4) do
    ADNLPProblems.powellsg(use_nls = true, n = 1)
  end
  _check_adjusted_warning("powellsg: number of variables adjusted from 1 to 4", 4) do
    MathOptNLPModel(PureJuMP.powellsg(n = 1))
  end
  _check_adjusted_warning("powellsg: number of variables adjusted from 1 to 4", 4) do
    MathOptNLPModel(PureJuMP.powellsg(use_nls = true, n = 1))
  end

  _check_adjusted_warning("srosenbr: number of variables adjusted from 1 to 2", 2) do
    ADNLPProblems.srosenbr(n = 1)
  end
  _check_adjusted_warning("srosenbr: number of variables adjusted from 1 to 2", 2) do
    MathOptNLPModel(PureJuMP.srosenbr(n = 1))
  end

  _check_adjusted_warning("watson: number of variables adjusted from 1 to 2", 2) do
    ADNLPProblems.watson(n = 1)
  end
  _check_adjusted_warning("watson: number of variables adjusted from 1 to 2", 2) do
    ADNLPProblems.watson(use_nls = true, n = 1)
  end

  _check_adjusted_warning("woods: number of variables adjusted from 1 to 4", 4) do
    ADNLPProblems.woods(n = 1)
  end
  _check_adjusted_warning("woods: number of variables adjusted from 1 to 4", 4) do
    MathOptNLPModel(PureJuMP.woods(n = 1))
  end

  _check_adjusted_warning("bearing: number of variables adjusted from 1 to 9", 9) do
    ADNLPProblems.bearing(n = 1)
  end
  _check_adjusted_warning("bearing: number of variables adjusted from 1 to 9", 9) do
    MathOptNLPModel(PureJuMP.bearing(n = 1))
  end

  _check_adjusted_warning("broydn7d: number of variables adjusted from 1 to 2", 2) do
    MathOptNLPModel(PureJuMP.broydn7d(n = 1))
  end

  _check_adjusted_warning("dixmaan: number of variables adjusted from 1 to 3", 3) do
    MathOptNLPModel(PureJuMP.dixmaane(n = 1))
  end
  _check_adjusted_warning("dixmaan: number of variables adjusted from 1 to 3", 3) do
    MathOptNLPModel(PureJuMP.dixmaani(n = 1))
  end
  _check_adjusted_warning("dixmaan: number of variables adjusted from 1 to 3", 3) do
    MathOptNLPModel(PureJuMP.dixmaanm(n = 1))
  end

  _check_adjusted_warning("spmsrtls: number of variables adjusted from 99 to 100", 100) do
    ADNLPProblems.spmsrtls(use_nls = true, n = 99)
  end
  _check_adjusted_warning("NZF1: number of variables adjusted from 1 to 26", 26) do
    ADNLPProblems.NZF1(use_nls = true, n = 1)
  end
end

@test setdiff(union(names(ADNLPProblems), list_problems_not_ADNLPProblems), list_problems) ==
      [:ADNLPProblems]
@test setdiff(union(names(PureJuMP), list_problems_not_PureJuMP), list_problems) == [:PureJuMP]
