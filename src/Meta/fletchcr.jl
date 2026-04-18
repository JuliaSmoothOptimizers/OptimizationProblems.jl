fletchcr_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "fletchcr",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 9900.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source:
problem 32 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

CUTEst cites
  The second problem given by
  R. Fletcher,
  "An optimal positive definite update for sparse Hessian matrices"
  Numerical Analysis report NA/145, University of Dundee, 1992.

  Scaled version.

  SIF input: Nick Gould, Oct 1992.

as source for this problem.
It is possible that Fletcher may have used this problem in his
technical report, but the published version of his report

  SIAM J. Optimization, 5(1), pp 192-218, 1995

uses the chained Rosenbrock problem, not the one below.

classification OUR2-AN-V-0

J.-P. Dussault, Rennes 09/2015.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_fletchcr_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_fletchcr_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_fletchcr_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_fletchcr_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_fletchcr_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_fletchcr_nineq(; n::Integer = default_nvar, kwargs...) = 0
