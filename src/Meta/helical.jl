helical_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "helical",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source: problem 7 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_helical_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_helical_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_helical_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_helical_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_helical_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_helical_nineq(; n::Integer = default_nvar, kwargs...) = 0
