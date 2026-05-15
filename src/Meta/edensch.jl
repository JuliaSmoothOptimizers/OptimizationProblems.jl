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

classification OUR2-AN-V-0
""",
  :origin_notes => raw"""
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

SIF input: Ph. Toint, Apr 1990.
minor correction by Ph. Shott, January 1995.

D. Orban, Montreal, 08/2015.
""",
  :reference => raw"""
@article{Li1988SIAMJNA,
  author  = {Li, Guangye},
  title   = {The Secant/Finite Difference Algorithm for Solving Sparse Nonlinear Systems of Equations},
  journal = {SIAM Journal on Numerical Analysis},
  year    = {1988},
  volume  = {25},
  number  = {5},
  pages   = {1181--1196},
  doi     = {10.1137/0725067}
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
