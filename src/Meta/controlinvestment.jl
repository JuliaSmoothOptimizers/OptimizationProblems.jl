controlinvestment_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => div(default_nvar, 2),
  :variable_ncon => true,
  :minimize => true,
  :name => "controlinvestment",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.98,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "",
  :notes => raw"""
This is a simple investment problem in optimistic market.
""",
  :origin_notes => raw"""
Example 5.3, Dominique Orban, Computation Optimization and Control lecture notes at Polytechnique Montréal.
""",
  :reference => raw"""
@misc{OrbanControlNotes,
  author    = {Dominique Orban},
  title     = {Computation Optimization and Control Lecture Notes},
  howpublished = {Lecture notes, Polytechnique Montréal},
  year      = {2022}
}  
  """,
  :lib => "",
)
get_controlinvestment_nvar(; n::Int = default_nvar, kwargs...) = 2 * div(n, 2)
get_controlinvestment_ncon(; n::Int = default_nvar, kwargs...) = div(n, 2)
get_controlinvestment_nlin(; n::Int = default_nvar, kwargs...) = 1
get_controlinvestment_nnln(; n::Int = default_nvar, kwargs...) = div(n, 2) - 1
get_controlinvestment_nequ(; n::Int = default_nvar, kwargs...) = div(n, 2)
get_controlinvestment_nineq(; n::Int = default_nvar, kwargs...) = 0
