genrose_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "genrose",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 405.1064193957891,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Generalized Rosenbrock function.

Source:
Y.-W. Shang and Y.-H. Qiu,
A note on the extended Rosenbrock function,
Evolutionary Computation, 14(1):119–126, 2006.

Shang and Qiu claim the "extended" Rosenbrock function
previously appeared in

K. A. de Jong,
An analysis of the behavior of a class of genetic
adaptive systems,
PhD Thesis, University of Michigan, Ann Arbor,
Michigan, 1975,
(http://hdl.handle.net/2027.42/4507)

but I could not find it there, and in

D. E. Goldberg,
Genetic algorithms in search, optimization and
machine learning,
Reading, Massachusetts: Addison-Wesley, 1989,

but I don't have access to that book.

This unconstrained problem is analyzed in

S. Kok and C. Sandrock,
Locating and Characterizing the Stationary Points of
the Extended Rosenbrock Function,
Evolutionary Computation 17, 2009.
https://dx.doi.org/10.1162%2Fevco.2009.17.3.437

classification SUR2-AN-V-0

problem 36 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_genrose_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_genrose_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_genrose_nls_nequ(; n::Integer = default_nvar, kwargs...) = 2 * (n - 1) + 1
