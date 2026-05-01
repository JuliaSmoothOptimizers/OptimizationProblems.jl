edensch_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "edensch",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1699.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/EDENSCH.SIF",
  :notes => raw"""
The extended Dennis and Schnabel problem, as defined by Li.

Source:
G. Li,
The secant/finite difference algorithm for solving sparse
nonlinear systems of equations,
SIAM Journal on Numerical Analysis, 25(5), pp. 1181-1196, 1988.

See also

problem 24 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification OUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""
Problem :
The extended Dennis and Schnabel problem, as defined by Li.
Source:
G. Li,
"The secant/finite difference algorithm for solving sparse
nonlinear systems of equations",
SIAM Journal on Optimization, (to appear), 1990.
SIF input: Ph. Toint, Apr 1990.
minor correction by Ph. Shott, January 1995.
classification OUR2-AN-V-0
""",
  :reference => raw"""
@techreport{LuksanMatonohaVlcek2003,
  author       = {Luksan, Ladislav and Matonoha, Cestmir and Vlcek, Jan},
  title        = {Modified {CUTE} Problems for Sparse Unconstrained Optimization},
    institution  = {Institute of Computer Science, Academy of Sciences of the Czech Republic},
  number       = {1081},
  year         = {2003},
  address      = {Prague, Czech Republic},
  url          = {http://www.cs.cas.cz/matonoha/download/V1081.pdf},
  }  
  """,

  :lib => "CUTEst:EDENSCH, Luksan:24",
)
get_edensch_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_edensch_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_edensch_nineq(; n::Integer = default_nvar, kwargs...) = 0
