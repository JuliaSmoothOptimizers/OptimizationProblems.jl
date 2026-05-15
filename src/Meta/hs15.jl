hs15_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs15",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS15.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 15.

classification SQR2-AN-2-2

 N. Antunes, Curitiba, 10/2016.
""",
:origin_notes => raw"""
problem 15 in
W. Hock and K. Schittkowski,
"Test examples for nonlinear programming codes",
Lectures Notes in Economics and Mathematical Systems 187, Springer
Verlag, Heidelberg, 1981.

SIF input: A.R. Conn March 1990
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

  :lib => "CUTEst:HS15, HS:15",
)
get_hs15_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs15_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs15_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs15_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs15_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs15_nineq(; n::Integer = default_nvar, kwargs...) = 2