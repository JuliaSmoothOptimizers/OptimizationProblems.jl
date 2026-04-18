morebv_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "morebv",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.5009424758925529,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
The Boundary Value problem.
This is the nonlinear least-squares version without fixed variables.

Source:  problem 28 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#17 (p. 75).

classification SUR2-MN-V-0

Problem 39 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf

J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_morebv_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_morebv_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_morebv_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_morebv_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_morebv_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_morebv_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_morebv_nls_nequ(; n::Integer = default_nvar, kwargs...) = n
