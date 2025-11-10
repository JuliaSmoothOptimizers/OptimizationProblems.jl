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
SUITE["ADNLPProblems"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLP"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLP"]["constructor"] = BenchmarkGroup()
SUITE["ADNLPProblems"]["NLP"]["obj"] = BenchmarkGroup()
for pb in list_problems_ADNLPProblems
  SUITE["ADNLPProblems"]["NLP"]["constructor"][pb] =
    @benchmarkable eval(Meta.parse("OptimizationProblems.ADNLPProblems.$pb()"))
  SUITE["ADNLPProblems"]["NLP"]["obj"][pb] = @benchmarkable obj(nlp, nlp.meta.x0) setup =
    (nlp = eval(Meta.parse("OptimizationProblems.ADNLPProblems.$pb()")))
end

SUITE["ADNLPProblems"]["NLS"] = BenchmarkGroup()
for pb in
    intersect(Symbol.(meta[meta.objtype .== :least_squares, :name]), list_problems_ADNLPProblems)
  SUITE["ADNLPProblems"]["NLS"]["constructor"] =
    @benchmarkable eval(Meta.parse("OptimizationProblems.ADNLPProblems.$pb(use_nls = true)"))
  SUITE["ADNLPProblems"]["NLS"]["obj"] = @benchmarkable obj(nlp, nlp.meta.x0) setup =
    (nlp = eval(Meta.parse("OptimizationProblems.ADNLPProblems.$pb(use_nls = true)")))
end
SUITE["PureJuMP"] = BenchmarkGroup()
for pb in list_problems_ADNLPProblems
  SUITE["PureJuMP"]["constructor"] =
    @benchmarkable eval(Meta.parse("OptimizationProblems.PureJuMP.$pb()"))
  SUITE["PureJuMP"]["obj"] = @benchmarkable obj(nlp, nlp.meta.x0) setup =
    (nlp = MathOptNLPModel(eval(Meta.parse("OptimizationProblems.PureJuMP.$pb()"))))
end
