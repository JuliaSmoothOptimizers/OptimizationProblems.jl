nondquar_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "nondquar",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 106.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A nondiagonal quartic test problem.

This problem has an arrow-head type Hessian with a tridiagonal
central part and a border of width 1.
The Hessian is singular at the solution.

Source: problem 57 in
A.R. Conn, N.I.M. Gould, M. Lescrenier and Ph.L. Toint,
"Performance of a multi-frontal scheme for partially separable
optimization"
Report 88/4, Dept of Mathematics, FUNDP (Namur, B), 1988.

classification OUR2-AN-V-0

Problem 45 in
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
get_nondquar_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_nondquar_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_nondquar_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_nondquar_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_nondquar_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_nondquar_nineq(; n::Integer = default_nvar, kwargs...) = 0
