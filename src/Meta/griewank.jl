griewank_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "griewank",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.0,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :modelling,
  :implementation => :both,
  :url => "https://doi.org/10.1007/BF00933356",
  :notes => raw"""
A multimodal function composed of a quadratic term and a cosine modulation.
The global minimum of 0 is at the origin. The search domain is [-600, 600]^n.
The function becomes easier as dimension increases due to the product term
being averaged out.
""",
  :origin_notes => raw"""
Introduced by Andreas Griewank in 1981.
""",
  :reference => raw"""
@article{Griewank1981,
  author  = {Griewank, Andreas O.},
  title   = {Generalized Descent for Global Optimization},
  journal = {Journal of Optimization Theory and Applications},
  volume  = {34},
  number  = {1},
  pages   = {11--39},
  year    = {1981},
  doi     = {10.1007/BF00933356}
}
""",
  :lib => "",
)
get_griewank_nvar(; n::Int = default_nvar, kwargs...) = n
get_griewank_ncon(; n::Int = default_nvar, kwargs...) = 0
get_griewank_nlin(; n::Int = default_nvar, kwargs...) = 0
get_griewank_nnln(; n::Int = default_nvar, kwargs...) = 0
get_griewank_nequ(; n::Int = default_nvar, kwargs...) = 0
get_griewank_nineq(; n::Int = default_nvar, kwargs...) = 0
