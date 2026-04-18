BOX2_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "BOX2",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.9422842504428566,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Box problem in 2 variables, obtained by fixing X3 = 1 in BOX2.

Source: Problem 11 in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

classification SXR2-AN-3-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_BOX2_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_BOX2_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_BOX2_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_BOX2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_BOX2_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_BOX2_nineq(; n::Integer = default_nvar, kwargs...) = 0
