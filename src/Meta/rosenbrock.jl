rosenbrock_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "rosenbrock",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 32.308641975308646,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1093/comjnl/3.3.175",
  :notes => raw"""
The classical 2-variable Rosenbrock (banana valley) function, a special case of the
generalized Rosenbrock (genrose). The unique global minimum is at (1, 1) with value 0.
""",
  :origin_notes => raw"""
H. H. Rosenbrock,
"An Automatic Method for Finding the Greatest or Least Value of a Function",
The Computer Journal, vol. 3(3), pp. 175–184, 1960.
doi: 10.1093/comjnl/3.3.175
""",
  :reference => raw"""
@article{Rosenbrock1960,
  author  = {Rosenbrock, H. H.},
  title   = {An Automatic Method for Finding the Greatest or Least Value of a Function},
  journal = {The Computer Journal},
  year    = {1960},
  volume  = {3},
  number  = {3},
  pages   = {175--184},
  doi     = {10.1093/comjnl/3.3.175}
}
""",
  :lib => "",
)
get_rosenbrock_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_rosenbrock_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_rosenbrock_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_rosenbrock_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_rosenbrock_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_rosenbrock_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_rosenbrock_nls_nequ(; n::Integer = default_nvar, kwargs...) = 3
