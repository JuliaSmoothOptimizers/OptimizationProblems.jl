cragglvy2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "cragglvy2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 52823.07152952862,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Chained Cragg and Levy function

This is similar to cragglvy but the quartic term differs.

Problem 17 in
Conn, A.R., Gould, N.I.M, Toint, P.,
Testing a Class of Methods for Solving
Minimization Problems with Simple Bounds on the Variables, 
Mathematics of Computation, 
Vol. 50, pp. 399-430, 1988.

Problem 4 in
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

get_cragglvy2_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_cragglvy2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy2_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy2_nls_nequ(; n::Integer = default_nvar, kwargs...) = 5 * (div(n, 2) - 1)
