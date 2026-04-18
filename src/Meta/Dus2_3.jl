Dus2_3_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "Dus2_3",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.972972972972973,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A one dimensional optimization problem

Problem found in
http://www.dmi.usherb.ca/~dussault/ROP630E17/
Jean_pierre Dussault

S. Goyette, Sherbrooke 2016/2017
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_Dus2_3_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_Dus2_3_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_Dus2_3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_Dus2_3_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_Dus2_3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_Dus2_3_nineq(; n::Integer = default_nvar, kwargs...) = 0
