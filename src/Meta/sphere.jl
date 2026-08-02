sphere_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "sphere",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :quadratic,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.0,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :modelling,
  :implementation => :both,
  :url => "https://doi.org/10.1145/355934.355936",
  :notes => raw"""
The simplest convex test function: sum of squares. The global minimum of 0 is
at the origin. The search domain is [-1, 1]^n in this implementation.
""",
  :origin_notes => raw"""
A classic unconstrained optimization test problem, also known as the De Jong
function 1. Commonly listed as problem 1 in Moré, Garbow and Hillstrom (1981).
""",
  :reference => raw"""
@article{MoreGarbowHillstrom1981,
  author  = {Mor{\'e}, Jorge J. and Garbow, Burton S. and Hillstrom, Kenneth E.},
  title   = {Testing Unconstrained Optimization Software},
  journal = {ACM Transactions on Mathematical Software},
  year    = {1981},
  volume  = {7},
  number  = {1},
  pages   = {17--41},
  doi     = {10.1145/355934.355936}
}
""",
  :lib => "",
)
get_sphere_nvar(; n::Int = default_nvar, kwargs...) = n
get_sphere_ncon(; n::Int = default_nvar, kwargs...) = 0
get_sphere_nlin(; n::Int = default_nvar, kwargs...) = 0
get_sphere_nnln(; n::Int = default_nvar, kwargs...) = 0
get_sphere_nequ(; n::Int = default_nvar, kwargs...) = 0
get_sphere_nineq(; n::Int = default_nvar, kwargs...) = 0
