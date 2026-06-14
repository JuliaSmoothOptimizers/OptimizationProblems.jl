hs12_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs12",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS12.SIF",
  :notes => raw"""
Hock and Schittkowski problem number 12.

classification QQR2-AN-2-1

N. Antunes, Curitiba, 10/2016.
""",
  :origin_notes => raw"""
  problem 12 in
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
  :lib => "CUTEst:HS12, HS:12",
)
get_hs12_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs12_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs12_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs12_nnln(; n::Int = default_nvar, kwargs...) = 1
get_hs12_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs12_nineq(; n::Int = default_nvar, kwargs...) = 1
