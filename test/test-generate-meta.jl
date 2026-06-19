using Distributed, NLPModels, NLPModelsJuMP, OptimizationProblems, Test
import ADNLPModels

include(joinpath(@__DIR__, "utils.jl"))

# All 22 keys that every meta Dict must contain.
const _ALL_META_KEYS = [
  ":nvar",
  ":variable_nvar",
  ":ncon",
  ":variable_ncon",
  ":minimize",
  ":name",
  ":has_equalities_only",
  ":has_inequalities_only",
  ":has_bounds",
  ":has_fixed_variables",
  ":objtype",
  ":contype",
  ":best_known_lower_bound",
  ":best_known_upper_bound",
  ":is_feasible",
  ":defined_everywhere",
  ":origin",
  ":url",
  ":notes",
  ":origin_notes",
  ":reference",
  ":lib",
]

@testset "generate_meta: all 22 meta keys are emitted" begin
  nlp = OptimizationProblems.ADNLPProblems.arwhead()
  str = generate_meta(nlp, "arwhead")
  for key in _ALL_META_KEYS
    @test occursin(key, str)
  end
end

@testset "generate_meta: six getter functions are emitted" begin
  nlp = OptimizationProblems.ADNLPProblems.arwhead()
  str = generate_meta(nlp, "arwhead")
  for suffix in ("nvar", "ncon", "nlin", "nnln", "nequ", "nineq")
    @test occursin("get_arwhead_$suffix", str)
  end
end

@testset "generate_meta: output is parseable Julia" begin
  nlp = OptimizationProblems.ADNLPProblems.arwhead()
  str = generate_meta(nlp, "arwhead")
  @test Meta.parse("begin\n$str\nend") isa Expr
end

@testset "generate_meta: constrained problem emits all 22 keys" begin
  nlp = OptimizationProblems.ADNLPProblems.hs7()
  str = generate_meta(nlp, "hs7")
  for key in _ALL_META_KEYS
    @test occursin(key, str)
  end
end
