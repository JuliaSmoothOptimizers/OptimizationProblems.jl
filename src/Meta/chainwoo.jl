chainwoo_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "chainwoo",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 371954.1,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/CHAINWOO.SIF",
  :notes => raw"""
Source:  problem 8 in
A. R. Conn, N. I. M. Gould and Ph. L. Toint,
Testing a class of methods for solving minimization
problems with simple bounds on their variables,
Mathematics of Computation 50, p 399-430, 1988.

See also

problem 5 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification SUR2-AN-V-0

D. Orban, Montreal, 08/2015.

Difference with the following is the initial guess.

Problem 2 in
L. Luksan, C. Matonoha and J. Vlcek
Sparse Test Problems for Unconstrained Optimization,
Technical Report 1064,
Institute of Computer Science,
Academy of Science of the Czech Republic

https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
""",
  :origin_notes => raw"""
Problem :
The chained Woods problem, a variant on Woods function
This problem is a sum of n/2 sets of 6 terms, each of which is
assigned its own group.  For a given set i, the groups are
A(i), B(i), C(i), D(i), E(i) and F(i). Groups A(i) and C(i) contain 1
nonlinear element each, denoted Y(i) and Z(i).
The problem dimension is defined from the number of these sets.
The number of problem variables is then 2 times + 2 as large
This version uses a slightly unorthodox expression of Woods
function as a sum of squares (see Buckley)
Source:  problem 8 in
A.R.Conn,N.I.M.Gould and Ph.L.Toint,
"Testing a class of methods for solving minimization 
problems with simple bounds on their variables, 
Mathematics of Computation 50, pp 399-430, 1988.
SIF input: Nick Gould and Ph. Toint, Dec 1995.
classification SUR2-AN-V-0
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

  :lib => "CUTEst:CHAINWOO, Luksan:5, LuksanSparse:2",
)
get_chainwoo_nvar(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))
get_chainwoo_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nls_nequ(; n::Integer = default_nvar, kwargs...) = 1 + 6 * (div(n, 2) - 1)
