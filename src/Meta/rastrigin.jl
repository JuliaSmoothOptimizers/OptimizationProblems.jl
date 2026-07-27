rastrigin_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "rastrigin",
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
  :url => "",
  :notes => raw"""
A non-convex multimodal function based on cosine modulation. The global minimum
of 0 is at the origin. The search domain is [-5.12, 5.12]^n. The large number
of local minima makes it a difficult test problem for global optimizers.
""",
  :origin_notes => raw"""
First proposed by L.A. Rastrigin in 1974 as a 2-dimensional function.
The n-dimensional generalization is due to Rudolph (1990) and was popularized
by Hoffmeister & Bäck (1991) and Mühlenbein et al. (1991).
""",
  :reference => raw"""
@book{Rastrigin1974,
  author    = {Rastrigin, L. A.},
  title     = {Systems of Extremal Control},
  publisher = {Nauka},
  address   = {Moscow},
  year      = {1974}
}
""",
  :lib => "",
)
get_rastrigin_nvar(; n::Int = default_nvar, kwargs...) = n
get_rastrigin_ncon(; n::Int = default_nvar, kwargs...) = 0
get_rastrigin_nlin(; n::Int = default_nvar, kwargs...) = 0
get_rastrigin_nnln(; n::Int = default_nvar, kwargs...) = 0
get_rastrigin_nequ(; n::Int = default_nvar, kwargs...) = 0
get_rastrigin_nineq(; n::Int = default_nvar, kwargs...) = 0
