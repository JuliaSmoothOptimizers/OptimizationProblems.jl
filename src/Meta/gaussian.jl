gaussian_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "gaussian",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 3.888106991166885e-6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source: Problem 9 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#28

classification SUR2-AN-3-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_gaussian_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_gaussian_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_gaussian_nls_nequ(; n::Integer = default_nvar, kwargs...) = 15
