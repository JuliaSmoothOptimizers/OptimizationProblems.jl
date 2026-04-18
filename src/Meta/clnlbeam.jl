clnlbeam_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 64,
  :variable_ncon => true,
  :minimize => true,
  :name => "clnlbeam",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 350.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://onlinelibrary.wiley.com/doi/abs/10.1002/oca.4660120103",
  :notes => raw"""
The clnlbeam problem
https://jump.dev/JuMP.jl/stable/tutorials/nonlinear/clnlbeam/
""",
  :origin_notes => raw"""
H. Maurer and H.D. Mittelman, "The non-linear beam via optimal control with bound state variables", Optimal Control Applications and Methods 12, pp. 19-31, 1991.  
""",
  :reference => raw"""
@article{MaurerMittelmann1991,
  author  = {H. Maurer and H.D. Mittelmann},
  title   = {The non-linear beam via optimal control with bound state variables},
  journal = {Optimal Control Applications and Methods},
  volume  = {12},
  number  = {1},
  pages   = {19--31},
  year    = {1991},
  doi     = {10.1002/oca.4660120103}
}  
  """,
)
get_clnlbeam_nvar(; n::Integer = default_nvar, kwargs...) = 3 * div(n - 3, 3) + 3
get_clnlbeam_ncon(; n::Integer = default_nvar, kwargs...) = 2 * div(n - 3, 3)
get_clnlbeam_nlin(; n::Integer = default_nvar, kwargs...) = div(n - 3, 3)
get_clnlbeam_nnln(; n::Integer = default_nvar, kwargs...) = div(n - 3, 3)
get_clnlbeam_nequ(; n::Integer = default_nvar, kwargs...) = 2 * div(n - 3, 3)
get_clnlbeam_nineq(; n::Integer = default_nvar, kwargs...) = 0
