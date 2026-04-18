penalty2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "penalty2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.6884776914936244e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source:  Problem 24 in
J.J. Moré, B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#112 (p. 80)

classification SUR2-AN-V-0
J.-P. Dussault, Clermont-Ferrand 06/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_penalty2_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_penalty2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_penalty2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_penalty2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_penalty2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_penalty2_nineq(; n::Integer = default_nvar, kwargs...) = 0
