colville6_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "colville6",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 8927.5977,
  :is_feasible => true,
  :defined_everywhere => true,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://github.com/ralna/SIF/blob/master/COLVILLE6.SIF",
  :notes => raw"""
Optimization of an electrical network (EDF) by P. Huard.

This is CUTEst's COLVILLE6: Hock and Schittkowski problem 87 with
Colville's constants b = f = 1.48477, starting from the point x0 given
by Hock and Schittkowski. Hock and Schittkowski print b = 1.48577 (used
in hs87 and CUTEst's HS87), but their constants d = cos(1.47588) and
e = sin(1.47588), with 1.47588 = b - 0.00889, and their solution
require b = 1.48477.

The objective is piecewise linear and discontinuous: 30 x1 for x1 < 300
and 31 x1 otherwise, plus 28 x2 for x2 < 100, 29 x2 for 100 <= x2 < 200,
and 30 x2 otherwise.

classification OOI2-MN-6-4
""",
  :origin_notes => raw"""
problem 87 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

Note: There are two variants described in the papers
D.H. Himmelblau "Applied nonlinear programming",
McGraw-Hill, New-York, 1972, problem 15,
and
A.R. Colville, "A comparative study on nonlinear programming",
IBM Scientific Center Report 320-2949, New York, 1968, problem 6.

SIF input: Nick Gould, August 1991.
           Colville's variant of HS87 by Tim Holy, Oct 2026.
""",
  :reference => raw"""
@book{HockSchittkowski1981,
  author    = {Hock, W. and Schittkowski, K.},
  title     = {Test Examples for Nonlinear Programming Codes},
  series    = {Lecture Notes in Economics and Mathematical Systems},
  volume    = {187},
  publisher = {Springer-Verlag},
  address   = {Heidelberg},
  year      = {1981},
  doi       = {10.1007/978-3-642-48320-2}
}
@techreport{Colville1968,
  author      = {Colville, A. R.},
  title       = {A Comparative Study on Nonlinear Programming Codes},
  institution = {IBM New York Scientific Center},
  number      = {320-2949},
  address     = {New York},
  year        = {1968}
}
@book{Himmelblau1972,
  author    = {Himmelblau, David M.},
  title     = {Applied Nonlinear Programming},
  publisher = {McGraw-Hill},
  address   = {New York},
  year      = {1972}
}
""",
  :lib => "CUTEst:COLVILLE6",
)
get_colville6_nvar(; n::Int = default_nvar, kwargs...) = 6
get_colville6_ncon(; n::Int = default_nvar, kwargs...) = 4
get_colville6_nlin(; n::Int = default_nvar, kwargs...) = 0
get_colville6_nnln(; n::Int = default_nvar, kwargs...) = 4
get_colville6_nequ(; n::Int = default_nvar, kwargs...) = 4
get_colville6_nineq(; n::Int = default_nvar, kwargs...) = 0
