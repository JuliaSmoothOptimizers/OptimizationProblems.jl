using ADNLPModels, OptimizationProblems, Test
println("Running browngen direct checks...")
nlp32 = ADNLPProblems.browngen(type=Float32)
x0 = nlp32.meta.x0
@test eltype(x0) == Float32
@test typeof(obj(nlp32, x0)) == Float32
nls = ADNLPProblems.browngen(use_nls=true)
@test typeof(nls) <: ADNLPModels.ADNLSModel
x = nls.meta.x0
Fx = similar(x, nls.nls_meta.nequ)
residual!(nls, x, Fx)
m = OptimizationProblems.eval(Meta.parse("get_browngen_nls_nequ"))()
@test nls.nls_meta.nequ == m
println("browngen direct checks passed")
