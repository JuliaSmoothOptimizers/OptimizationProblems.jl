linsv_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "linsv",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://github.com/JuliaSmoothOptimizers/NLPModelsTest.jl",
  :notes => raw"""

""",
  :origin_notes => raw"""
Test problem used in NLPModelsTest.jl.
""",
  :reference => raw"""
@misc{NLPModelsTestjl,
  author       = {{JuliaSmoothOptimizers}},
  title        = {{NLPModelsTest.jl}: Tests for Nonlinear Programming Models},
  howpublished = {\url{https://github.com/JuliaSmoothOptimizers/NLPModelsTest.jl}},
  year         = {2020}
}
""",
  :lib => "",
)
get_linsv_nvar(; n::Int = default_nvar, kwargs...) = 2
get_linsv_ncon(; n::Int = default_nvar, kwargs...) = 2
get_linsv_nlin(; n::Int = default_nvar, kwargs...) = 2
get_linsv_nnln(; n::Int = default_nvar, kwargs...) = 0
get_linsv_nequ(; n::Int = default_nvar, kwargs...) = 0
get_linsv_nineq(; n::Int = default_nvar, kwargs...) = 2
