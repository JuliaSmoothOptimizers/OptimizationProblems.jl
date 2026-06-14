clplatea_meta = Dict(
  :nvar => default_nvar,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "clplatea",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/CLPLATEA.SIF",
  :notes => raw"""
The clamped plate problem (Strang, Nocedal, Dax).
The problem comes from the discretization the following problem
in mechanics:  a plate is clamped on one edge and loaded on the
opposite side.  The plate is the unit square.

In this version of the problem, the weight wght is entirely put on the
upper right corner of the plate.

The plate is clamped on its lower edge, by fixing the
corresponding variables to zero.

classification OXR2-MN-V-0

p is the number of points in one side of the unit square
The number of variables is p*p, of which (p-1)*(p-1) are free.

Fixed variables have been eliminated from the objective function.
""",
  :origin_notes => raw"""
J. Nocedal,
"Solving large nonlinear systems of equations arising in mechanics",
Proceedings of the Cocoyoc Numerical Analysis Conference, Mexico,
pp. 132-141, 1981.

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@inproceedings{Nocedal1981,
  author    = {J. Nocedal},
  title     = {Solving large nonlinear systems of equations arising in mechanics},
  booktitle = {Proceedings of the Cocoyoc Numerical Analysis Conference},
  address   = {Mexico},
  pages     = {132--141},
  year      = {1981}
}  
  """,
  :lib => "CUTEst:CLPLATEA",
)
get_clplatea_nvar(; n::Int = default_nvar, kwargs...) = max(floor(Int, sqrt(n)), 3)^2
get_clplatea_ncon(; n::Int = default_nvar, kwargs...) = 0
get_clplatea_nlin(; n::Int = default_nvar, kwargs...) = 0
get_clplatea_nnln(; n::Int = default_nvar, kwargs...) = 0
get_clplatea_nequ(; n::Int = default_nvar, kwargs...) = 0
get_clplatea_nineq(; n::Int = default_nvar, kwargs...) = 0
