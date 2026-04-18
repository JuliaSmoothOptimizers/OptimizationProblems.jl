argauss_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 15,
  :variable_ncon => false,
  :minimize => true,
  :name => "argauss",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1145/355934.355936",
  :notes => raw"""
  SIF input: Ph. Toint, Dec 1989.
  classification NOR2-AN-3-15
""",
  :origin_notes => raw"""
Source: Problem 9 in
  J.J. More', B.S. Garbow and K.E. Hillstrom,
  "Testing Unconstrained Optimization Software",
  ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
  See also Buckley#28  
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
)
get_argauss_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_argauss_ncon(; n::Integer = default_nvar, kwargs...) = 15
get_argauss_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_argauss_nnln(; n::Integer = default_nvar, kwargs...) = 15
get_argauss_nequ(; n::Integer = default_nvar, kwargs...) = 15
get_argauss_nineq(; n::Integer = default_nvar, kwargs...) = 0
