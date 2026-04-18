meyer3_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "meyer3",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.6936078094361455e9,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Meyer function

Source:  Problem 10 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley #29 (p. 73).

classification SUR2-RN-3-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_meyer3_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_meyer3_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nls_nequ(; n::Integer = default_nvar, kwargs...) = 16
