hs203_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs203",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.0,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => true,
  :origin => :academic,
  :implementation => :both,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 203.

Beale function: 2 variables, unconstrained, least-squares.
f(x) = (1.5 - x1*(1-x2))^2 + (2.25 - x1*(1-x2^2))^2 + (2.625 - x1*(1-x2^3))^2
Starting point: x0 = (2, 0.2), F(x0) = 0.529781.
Minimizer: x* = (3, 0.5), F* = 0.
Distinct from the beale problem in this collection (no 1/2 scaling factor; different starting point).
""",
  :origin_notes => raw"""
Problem 203 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.
Original sources: [5] E.M.L. Beale; [41] D.M. Himmelblau; [14] R.P. Brent; [37] Gill and Murray.
""",
  :reference => raw"""
@book{Schittkowski1987,
  author    = {Schittkowski, Klaus},
  title     = {More Test Examples for Nonlinear Programming Codes},
  series    = {Lecture Notes in Economics and Mathematical Systems},
  volume    = {282},
  publisher = {Springer-Verlag},
  address   = {Heidelberg},
  year      = {1987}
}
  """,
  :lib => "HS2:203",
)
get_hs203_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs203_ncon(; n::Int = default_nvar, kwargs...) = 0
get_hs203_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs203_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs203_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs203_nineq(; n::Int = default_nvar, kwargs...) = 0
get_hs203_nls_nequ(; n::Int = default_nvar, kwargs...) = 3
