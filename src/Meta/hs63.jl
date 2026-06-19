hs63_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs63",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS63.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 63.

classification QQR2-AY-3-2

classification QQR2-AN-3-2
A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
problem 63 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: J-M COLLIN, April 1990.
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
  :lib => "CUTEst:HS63, HS:63",
)
get_hs63_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs63_ncon(; n::Int = default_nvar, kwargs...) = 2
get_hs63_nlin(; n::Int = default_nvar, kwargs...) = 1
get_hs63_nnln(; n::Int = default_nvar, kwargs...) = 1
get_hs63_nequ(; n::Int = default_nvar, kwargs...) = 2
get_hs63_nineq(; n::Int = default_nvar, kwargs...) = 0
