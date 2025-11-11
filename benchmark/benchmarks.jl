# Include useful packages
using ADNLPModels, NLPModels, OptimizationProblems
using BenchmarkTools
# Most likely benchmark with JuMP as well
using JuMP, NLPModelsJuMP

const list_problems = Symbol.(OptimizationProblems.meta[!, :name])

# Should match the runtests
const list_problems_not_ADNLPProblems =
  Symbol[:catmix, :gasoil, :glider, :methanol, :minsurf, :pinene, :rocket, :steering, :torsion]
const list_problems_ADNLPProblems = setdiff(list_problems, list_problems_not_ADNLPProblems)
const list_problems_not_PureJuMP = Symbol[]
const list_problems_PureJuMP = setdiff(list_problems, list_problems_not_PureJuMP)

# Run locally with `tune!(SUITE)` and then `run(SUITE)`
const SUITE = BenchmarkGroup()

const SAMPLES = 5
const EVALS = 1

SUITE["ADNLPProblems"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLP"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLP"]["constructor"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLP"]["obj"] = BenchmarkGroup()
for pb in list_problems_ADNLPProblems
  problem_constructor = getproperty(OptimizationProblems.ADNLPProblems, Symbol(pb))
  SUITE["ADNLPProblems"]["NLP"]["constructor"][pb] =
    @benchmarkable $(problem_constructor)() samples=SAMPLES evals=EVALS
  SUITE["ADNLPProblems"]["NLP"]["obj"][pb] =
    @benchmarkable obj(nlp, nlp.meta.x0) samples=SAMPLES evals=EVALS setup =
      (nlp = $(problem_constructor)())
end

SUITE["ADNLPProblems"]["NLS"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLS"]["constructor"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLS"]["obj"] = BenchmarkGroup()
list_problems_nls_ADNLPProblems = intersect(
  Symbol.(OptimizationProblems.meta[OptimizationProblems.meta.objtype .== :least_squares, :name]),
  list_problems_ADNLPProblems,
)
for pb in list_problems_nls_ADNLPProblems
  problem_constructor = getproperty(OptimizationProblems.ADNLPProblems, Symbol(pb))
  SUITE["ADNLPProblems"]["NLS"]["constructor"][pb] =
    @benchmarkable $(problem_constructor)(use_nls = true) samples=SAMPLES evals=EVALS
  SUITE["ADNLPProblems"]["NLS"]["obj"][pb] =
    @benchmarkable obj(nlp, nlp.meta.x0) samples=SAMPLES evals=EVALS setup =
      (nlp = $(problem_constructor)(use_nls = true))
end
SUITE["PureJuMP"] = BenchmarkGroup()
SUITE["PureJuMP"]["constructor"] = BenchmarkGroup()
SUITE["PureJuMP"]["obj"] = BenchmarkGroup()
for pb in list_problems_PureJuMP
  problem_constructor = getproperty(OptimizationProblems.PureJuMP, Symbol(pb))
  SUITE["PureJuMP"]["constructor"][pb] =
    @benchmarkable $(problem_constructor)() samples=SAMPLES evals=EVALS
  SUITE["PureJuMP"]["obj"][pb] =
    @benchmarkable obj(nlp, nlp.meta.x0) samples=SAMPLES evals=EVALS setup =
      (nlp = MathOptNLPModel($(problem_constructor)()))
end
