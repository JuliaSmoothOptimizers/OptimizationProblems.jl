hs56_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs56",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/HS56.SIF",
  :notes => raw"""
        classification OOR2-AN-7-4

        classification PGR2-AN-7-4

        A. Montoison, Montreal, 05/2018.
        """,
  :origin_notes => raw"""
problem 56 in
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
  :lib => "CUTEst:HS56, HS:56",
)
get_hs56_nvar(; n::Int = default_nvar, kwargs...) = 7
get_hs56_ncon(; n::Int = default_nvar, kwargs...) = 4
get_hs56_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs56_nnln(; n::Int = default_nvar, kwargs...) = 4
get_hs56_nequ(; n::Int = default_nvar, kwargs...) = 4
get_hs56_nineq(; n::Int = default_nvar, kwargs...) = 0
