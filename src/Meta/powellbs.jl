powellbs_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "powellbs",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.5676308586741892,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source: problem 3 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also  Toint#34, Buckley#22 (p. 82).

classification NOR2-AN-2-2
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_powellbs_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_powellbs_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_powellbs_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_powellbs_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_powellbs_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_powellbs_nineq(; n::Integer = default_nvar, kwargs...) = 0
