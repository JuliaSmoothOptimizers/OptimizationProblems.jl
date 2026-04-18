powellsg_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "powellsg",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 5375.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
The extended Powell singular problem.
This problem is a sum of n/4 sets of four terms, each of which is assigned its own group.

Source:  Problem 13 & 22 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Toint#19, Buckley#34 (p.85)

classification OUR2-AN-V-0

Problem 47 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf

J.-P. Dussault, Clermont-Ferrand 05/2016.

Difference with the following is the initial guess.

Problem 3 in
L. Luksan, C. Matonoha and J. Vlcek
Sparse Test Problems for Unconstrained Optimization,
Technical Report 1064,
Institute of Computer Science,
Academy of Science of the Czech Republic

https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_powellsg_nvar(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
get_powellsg_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nls_nequ(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))
