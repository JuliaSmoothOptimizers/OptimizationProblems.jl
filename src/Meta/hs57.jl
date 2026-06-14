hs57_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs57",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.030798601687933858,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS57.SIF",
  :notes => raw"""
classification SQR2-AN-2-1

classification SQR-AN-2-1

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
problem 57 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: A.R. Conn, April 1990
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
  :lib => "CUTEst:HS57, HS:57",
)
get_hs57_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs57_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs57_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs57_nnln(; n::Int = default_nvar, kwargs...) = 1
get_hs57_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs57_nineq(; n::Int = default_nvar, kwargs...) = 1
get_hs57_nls_nequ(; n::Int = default_nvar, kwargs...) = 44
