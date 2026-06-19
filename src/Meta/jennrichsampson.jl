jennrichsampson_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "jennrichsampson",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4171.306161960493,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1145/355934.355936",
  :notes => raw"""

""",
  :origin_notes => raw"""
problem 6 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
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
  :lib => "MGH:6",
)
get_jennrichsampson_nvar(; n::Int = default_nvar, kwargs...) = 2
get_jennrichsampson_ncon(; n::Int = default_nvar, kwargs...) = 0
get_jennrichsampson_nlin(; n::Int = default_nvar, kwargs...) = 0
get_jennrichsampson_nnln(; n::Int = default_nvar, kwargs...) = 0
get_jennrichsampson_nequ(; n::Int = default_nvar, kwargs...) = 0
get_jennrichsampson_nineq(; n::Int = default_nvar, kwargs...) = 0
get_jennrichsampson_nls_nequ(; n::Int = default_nvar, m::Int = 10, kwargs...) = m
