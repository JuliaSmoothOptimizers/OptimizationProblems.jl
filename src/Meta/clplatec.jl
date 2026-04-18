clplatec_meta = Dict(
  :nvar => default_nvar,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "clplatec",
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
The clamped plate problem (Strang, Nocedal, Dax).
The problem comes from the discretization the following problem
in mechanics:  a plate is clamped on one edge and loaded on the
opposite side.  The plate is the unit square.

In this version of the problem, part of the weight wght is put on the
upper right corner of the plate, and the rest on the upper left corner.

The plate is clamped on its lower edge, by fixing the
corresponding variables to zero.

Source:
J. Nocedal,
"Solving large nonlinear systems of equations arising in mechanics",
Proceedings of the Cocoyoc Numerical Analysis Conference, Mexico,
pp. 132-141, 1981.

classification OXR2-MN-V-0

p is the number of points in one side of the unit square
The number of variables is p*p, of which (p-1)*(p-1) are free.

Fixed variables have been eliminated from the objective function.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_clplatec_nvar(; n::Integer = default_nvar, kwargs...) = floor(Int, sqrt(n))^2
get_clplatec_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_clplatec_nineq(; n::Integer = default_nvar, kwargs...) = 0
