ackley_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "ackley",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.0,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :modelling,
  :implementation => :both,
  :url => "https://doi.org/10.1007/978-1-4613-1997-9",
  :notes => raw"""
A non-convex multimodal function commonly used as a performance test problem for
global optimization algorithms. The function has a global minimum of 0 at the origin
and is surrounded by a nearly flat outer region that makes gradient-based methods difficult.
The search domain is [-32.768, 32.768]^n.
""",
  :origin_notes => raw"""
Proposed by David Ackley in his 1987 PhD dissertation.
The n-dimensional generalization is due to Bäck and Schwefel (1993).
""",
  :reference => raw"""
@book{Ackley1987,
  author    = {Ackley, David H.},
  title     = {A Connectionist Machine for Genetic Hillclimbing},
  publisher = {Kluwer Academic Publishers},
  address   = {Boston, MA},
  year      = {1987},
  doi       = {10.1007/978-1-4613-1997-9}
}
""",
  :lib => "",
)
get_ackley_nvar(; n::Int = default_nvar, kwargs...) = n
get_ackley_ncon(; n::Int = default_nvar, kwargs...) = 0
get_ackley_nlin(; n::Int = default_nvar, kwargs...) = 0
get_ackley_nnln(; n::Int = default_nvar, kwargs...) = 0
get_ackley_nequ(; n::Int = default_nvar, kwargs...) = 0
get_ackley_nineq(; n::Int = default_nvar, kwargs...) = 0
