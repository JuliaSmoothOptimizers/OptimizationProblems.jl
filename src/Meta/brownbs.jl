brownbs_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "brownbs",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 9.99998000003e11,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source: Problem 4 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#25
SIF input: Ph. Toint, Dec 1989.

classification SUR2-AN-2-0

A. Cebola, Curitiba 10/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_brownbs_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_brownbs_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_brownbs_nls_nequ(; n::Integer = default_nvar, kwargs...) = 3
