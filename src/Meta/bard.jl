bard_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "bard",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Bard problem in 3 variables.
This function is a nonlinear least squares with 15 groups.
Each group has a linear and a nonlinear element.

Source: Problem 8 in
   J.J. More', B.S. Garbow and K.E. Hillstrom,
   "Testing Unconstrained Optimization Software",
   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#16

classification SUR2-AN-3-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_bard_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_bard_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_bard_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_bard_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_bard_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_bard_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_bard_nls_nequ(; n::Integer = default_nvar, kwargs...) = 15
