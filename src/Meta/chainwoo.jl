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
  :url => "",
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
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_chainwoo_nvar(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))
get_chainwoo_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_chainwoo_nls_nequ(; n::Integer = default_nvar, kwargs...) = 1 + 6 * (div(n, 2) - 1)
