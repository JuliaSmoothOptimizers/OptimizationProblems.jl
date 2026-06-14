woods_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "woods",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 180451.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/WOODS.SIF",
  :notes => raw"""
The extended Woods problem.

   This problem is a sum of n/4 sets of 6 terms, each of which is
   assigned its own group.  For a given set i, the groups are
   A(i), B(i), C(i), D(i), E(i) and F(i). Groups A(i) and C(i) contain 1
   nonlinear element each, denoted Y(i) and Z(i).

   The problem dimension is defined from the number of these sets.
   The number of problem variables is then 4 times larger.

   This version uses a slightly unorthodox expression of Woods
   function as a sum of squares (see Buckley)

classification SUR2-AN-V-0

 See also

   problem 58 in
   L. Luksan, C. Matonoha and J. Vlcek
   Modified CUTE problems for sparse unconstrained optimization,
   Technical Report 1081,
   Institute of Computer Science,
   Academy of Science of the Czech Republic

   http://www.cs.cas.cz/matonoha/download/V1081.pdf

   classification SUR2-AN-V-0

 J.-P. Dussault, Clermont-Ferrand, 05/2016.
""",
  :origin_notes => raw"""
problem 14 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Toint#27, Buckley#17 (p. 101), Conn, Gould, Toint#7

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@article{MoreGarbowHillstrom1981,
  author  = {Mor{\'e}, Jorge J. and Garbow, Burton S. and Hillstrom, Kenneth E.},
  title   = {Testing Unconstrained Optimization Software},
  journal = {ACM Transactions on Mathematical Software},
  year    = {1981},
  volume  = {7},
  number  = {1},
  pages   = {17--41},
  doi     = {10.1145/355934.355936}
}  
""",
  :lib => "CUTEst:WOODS, Luksan:58",
)
get_woods_nvar(; n::Int = default_nvar, kwargs...) = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
get_woods_ncon(; n::Int = default_nvar, kwargs...) = 0
get_woods_nlin(; n::Int = default_nvar, kwargs...) = 0
get_woods_nnln(; n::Int = default_nvar, kwargs...) = 0
get_woods_nequ(; n::Int = default_nvar, kwargs...) = 0
get_woods_nineq(; n::Int = default_nvar, kwargs...) = 0
