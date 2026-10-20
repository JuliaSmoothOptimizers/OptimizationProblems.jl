colville1_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 10,
  :variable_ncon => false,
  :minimize => true,
  :name => "colville1",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -32.34867897,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
  :implementation => :both,
  :url => "https://github.com/ralna/SIF/blob/master/COLVILLE1.SIF",
  :notes => raw"""
Colville's Shell primal problem, with data as in Table II of Cornwell,
Hutchison, Minkoff and Schultz (1978) and in subroutine TP86 of
Schittkowski's Fortran code. This is hs86 with a_{2,4} = 0.4 rather than the
4 printed in Table 11 of Hock and Schittkowski, as in CUTEst's COLVILLE1.
Constraint 2, which contains a_{2,4}, is inactive at the hs86 solution,
so that point is also a solution of this problem.

classification OLR2-AN-5-10
""",
  :origin_notes => raw"""
D. E. Cornwell, R. A. Hutchison, M. Minkoff and H. K. Schultz,
"Test problems for constrained nonlinear mathematical programming
algorithms", Argonne National Laboratory report ANL-AMD-TM-320, 1978.

SIF input: Nick Gould, August 1991.
           Variant of HS86 by Tim Holy, Oct 2026.
""",
  :reference => raw"""
@techreport{CornwellHutchisonMinkoffSchultz1978,
  author      = {Cornwell, D. E. and Hutchison, R. A. and Minkoff, M. and Schultz, H. K.},
  title       = {Test Problems for Constrained Nonlinear Mathematical Programming Algorithms},
  institution = {Argonne National Laboratory},
  number      = {ANL-AMD-TM-320},
  year        = {1978}
}
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
  :lib => "CUTEst:COLVILLE1",
)
get_colville1_nvar(; n::Int = default_nvar, kwargs...) = 5
get_colville1_ncon(; n::Int = default_nvar, kwargs...) = 10
get_colville1_nlin(; n::Int = default_nvar, kwargs...) = 10
get_colville1_nnln(; n::Int = default_nvar, kwargs...) = 0
get_colville1_nequ(; n::Int = default_nvar, kwargs...) = 0
get_colville1_nineq(; n::Int = default_nvar, kwargs...) = 10
