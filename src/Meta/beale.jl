beale_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "beale",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 14.203125,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source: Problem 5 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#89.
SIF input: Ph. Toint, Dec 1989.

classification SUR2-AN-2-0

A. Cebola, Curitiba 10/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_beale_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_beale_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_beale_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_beale_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_beale_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_beale_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_beale_nls_nequ(; n::Integer = default_nvar, kwargs...) = 3
