hs87_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs87",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS87.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 87.

Optimization of an electrical network (EDF) by P. Huard.

classification OOI2-MN-6-4

classification PLR-AN-5-10
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
""",
  :reference => raw"""
@book{HockSchittkowski1981,
  author    = {Hock, W. and Schittkowski, K.},
  title     = {Test Examples for Nonlinear Programming Codes},
  series    = {Lecture Notes in Economics and Mathematical Systems},
  volume    = {187},
  publisher = {Springer-Verlag},
    address   = {Heidelberg},
  year      = {1981}
}  
  """,

  :lib => "CUTEst:HS87, HS:87",
)
get_hs87_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_hs87_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs87_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs87_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs87_nequ(; n::Integer = default_nvar, kwargs...) = 4
get_hs87_nineq(; n::Integer = default_nvar, kwargs...) = 0