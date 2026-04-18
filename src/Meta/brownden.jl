brownden_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "brownden",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7.926693336997432e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Brown and Dennis function

Source: Problem 16 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#30

classification SUR2-AN-4-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_brownden_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_brownden_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_brownden_nls_nequ(; n::Integer = default_nvar, kwargs...) = max(n, 4)
