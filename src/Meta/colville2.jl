colville2_meta = Dict(
  :nvar => 15,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "colville2",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 32.348678978788826,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
  :implementation => :both,
  :url => "https://github.com/ralna/SIF/blob/master/COLVILLE2.SIF",
  :notes => raw"""
Colville's Shell dual problem, with data as in Table II of Cornwell,
Hutchison, Minkoff and Schultz (1978) and in subroutine TP117 of
Schittkowski's Fortran code. This is hs117 with a_{2,4} = 0.4 rather than the
4 printed in Table 11 of Hock and Schittkowski, as in CUTEst's COLVILLE2.
a_{2,4} multiplies x_2, which is zero at the hs117 solution, so that
point is also a solution of this problem.

classification OQR2-AN-15-5
""",
  :origin_notes => raw"""
D. E. Cornwell, R. A. Hutchison, M. Minkoff and H. K. Schultz,
"Test problems for constrained nonlinear mathematical programming
algorithms", Argonne National Laboratory report ANL-AMD-TM-320, 1978.

SIF input: Nick Gould, August 1991.
           Variant of HS117 by Tim Holy, Oct 2026.
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
  :lib => "CUTEst:COLVILLE2",
)
get_colville2_nvar(; n::Int = default_nvar, kwargs...) = 15
get_colville2_ncon(; n::Int = default_nvar, kwargs...) = 5
get_colville2_nlin(; n::Int = default_nvar, kwargs...) = 0
get_colville2_nnln(; n::Int = default_nvar, kwargs...) = 5
get_colville2_nequ(; n::Int = default_nvar, kwargs...) = 0
get_colville2_nineq(; n::Int = default_nvar, kwargs...) = 5
