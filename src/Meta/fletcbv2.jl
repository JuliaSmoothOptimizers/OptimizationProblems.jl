fletcbv2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "fletcbv2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.5131082956600861,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/FLETCBV2.SIF",
  :notes => raw"""
Source:  The first problem given by
R. Fletcher,
"An optimal positive definite update for sparse Hessian matrices"
Numerical Analysis report NA/145, University of Dundee, 1992.

Scaled version.

SIF input: Nick Gould, Oct 1992.

problem 31 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification OUR2-AN-V-0

J,-P, Dussault, Rennes 09/2015.
""",
  :origin_notes => raw"""
Problem :
Another Boundary Value problem.
Source:  The first problem given by
R. Fletcher,
"An optimal positive definite update for sparse Hessian matrices"
Numerical Analysis report NA/145, University of Dundee, 1992.
but assuming that the 1/h**2 term should read h**2
This is what Fletcher intended (private communication).
The author comments: "The problem arises from discretizing the bvp
x"=-2+sin x in [0,1]
with x(0)=0, x(1)=1. This gives a symmetric system of equations,
the residual vector of which is the gradient of the given function."
He multiplies through by h^2 before integrating.
SIF input: Nick Gould, Nov 1992.
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

  :lib => "CUTEst:FLETCBV2, Luksan:31",
)
get_fletcbv2_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_fletcbv2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nineq(; n::Integer = default_nvar, kwargs...) = 0
