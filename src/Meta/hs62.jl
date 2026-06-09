hs62_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs62",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS62.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 62.

classification OLR2-AY-3-1

classification GLR2-AN-3-1
A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""
problem 62 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: J-M Collin and Ph. Toint, April 1990.
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
  :lib => "CUTEst:HS62, HS:62",
)
get_hs62_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs62_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs62_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs62_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs62_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs62_nineq(; n::Integer = default_nvar, kwargs...) = 0
