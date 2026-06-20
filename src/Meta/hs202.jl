hs202_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs202",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :sum_of_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1256.0,
  :is_feasible => true,
  :defined_everywhere => true,
  :origin => :academic,
  :implementation => :both,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 202.

Freudenstein-Roth function: 2 variables, unconstrained, sum-of-squares.
f(x) = (-13 + x1 + ((5-x2)*x2 - 2)*x2)^2 + (-29 + x1 + ((1+x2)*x2 - 14)*x2)^2
Starting point: x0 = (15, -2), F(x0) = 1256.
Global minimizer: x* = (5, 4), F* = 0.
A local minimizer near (11.41, -0.897) with F ≈ 48.98 also exists.
""",
  :origin_notes => raw"""
Problem 202 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.
Original sources: [34] F. Freudenstein and B. Roth (1963); [37] P.E. Gill and W. Murray (1976).
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
  :lib => "HS2:202",
)
get_hs202_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs202_ncon(; n::Int = default_nvar, kwargs...) = 0
get_hs202_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs202_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs202_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs202_nineq(; n::Int = default_nvar, kwargs...) = 0
