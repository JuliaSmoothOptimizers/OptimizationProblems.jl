catenary_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 32,
  :variable_ncon => true,
  :minimize => true,
  :name => "catenary",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :linear,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :academic,
  :url => "",
  :notes => raw"""
The classical problem of the hanging catenary.  Here the catenary consists
of N+1 beams of length BL, with the first beam fixed at the origin and
the final bean fixed at a fraction FRACT of the total length of all
beams.

The problem is non-convex.

Source: 
K. Veselic,
"De forma catenarum in campo gravitatis pendentium",
Klasicna Gimnazija u Zagrebu, Zagreb, 1987.

classification LQR2-AY-V-V

M. Gollier, Montréal, 05/2023
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_catenary_nvar(; n::Integer = default_nvar, kwargs...) = max(6, 3 * max(1, div(n, 3)))
get_catenary_ncon(; n::Integer = default_nvar, kwargs...) = max(2, max(1, div(n, 3))) - 1
get_catenary_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_catenary_nnln(; n::Integer = default_nvar, kwargs...) = max(2, max(1, div(n, 3))) - 1
get_catenary_nequ(; n::Integer = default_nvar, kwargs...) = max(2, max(1, div(n, 3))) - 1
get_catenary_nineq(; n::Integer = default_nvar, kwargs...) = 0
