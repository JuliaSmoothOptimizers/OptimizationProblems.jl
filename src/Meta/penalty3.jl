penalty3_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "penalty3",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.0063906885360703e8,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/PENALTY3.SIF",
  :notes => raw"""
A penalty problem by Gill, Murray and Pitfield.
It has a dense Hessian matrix.

classification OUR2-AY-V-0

Problem 46 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf
J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""
problem 114 (p. 81) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

SIF input: Nick Gould, Dec 1990.
""",
  :reference => raw"""
@techreport{Buckley1989,
  author      = {Buckley, A. G.},
  title       = {Test functions for unconstrained minimization},
  institution = {Computing Science Division, Dalhousie University},
  address     = {Dalhousie, Canada},
  number      = {CS-3},
  year        = {1989}
}  
  """,

  :lib => "CUTEst:PENALTY3, Luksan:46",
)
get_penalty3_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_penalty3_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_penalty3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_penalty3_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_penalty3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_penalty3_nineq(; n::Integer = default_nvar, kwargs...) = 0
