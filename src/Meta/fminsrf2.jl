fminsrf2_meta = Dict(
  :nvar => 100,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "fminsrf2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2504.26865839215,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/FMINSRF2.SIF",
  :notes => raw"""
The free boundary minimum surface problem.
The problem comes from the discretization of the minimum surface
problem on the unit square with "free boundary conditions"
one must find the minumum surface over the unit square 
(which is clearly 1.0).  Furthermore, the distance of the surface
from zero at the centre of the unit square is also minimized.
The unit square is discretized into (p-1)**2 little squares. The
heights of the considered surface above the corners of these little
squares are the problem variables,  There are p**2 of them.
Given these heights, the area above a little square is
approximated by the
S(i,j) = sqrt( 1 + 0.5(p-1)**2 ( a(i,j) + b(i,j) ) ) / (p-1)**2
where
a(i,j) = x(i,j) - x(i+1,j+1)
and
b(i,j) = x(i+1,j) - x(i,j+1)
""",
  :origin_notes => raw"""
Setting the boundary free in
A Griewank and Ph. Toint,
"Partitioned variable metric updates for large structured
optimization problems",
Numerische Mathematik 39:429-448, 1982.

SIF input: Ph. Toint, November 1991.

classification OUR2-MY-V-0

Problem 33 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf
J.-P. Dussault, Rennes 09/2015.
""",
  :reference => raw"""
@article{GriewankToint1982NM,
  author  = {Griewank, A. and Toint, Ph. L.},
  title   = {Partitioned variable metric updates for large structured optimization problems},
  journal = {Numerische Mathematik},
  year    = {1982},
  volume  = {39},
  number  = {1},
  pages   = {119--137},
  doi     = {10.1007/bf01399316}
}  
  """,

  :lib => "CUTEst:FMINSRF2, Luksan:33",
)
get_fminsrf2_nvar(; n::Integer = default_nvar, kwargs...) = 100
get_fminsrf2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nineq(; n::Integer = default_nvar, kwargs...) = 0
