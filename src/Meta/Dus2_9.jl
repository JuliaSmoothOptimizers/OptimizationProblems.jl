Dus2_9_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "Dus2_9",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://www.dmi.usherb.ca/~dussault/ROP630E17/",
  :notes => raw"""
A one dimensional optimization problem

S. Goyette, Sherbrooke 2016/2017
""",
  :origin_notes => raw"""
Problem found in
http://www.dmi.usherb.ca/~dussault/ROP630E17/
Jean_pierre Dussault
""",
  :reference => raw"""
@misc{Dussault2017,
  author       = {Dussault, Jean-Pierre},
  title        = {Optimization Test Problems},
  howpublished = {\url{http://www.dmi.usherb.ca/~dussault/ROP630E17/}},
  year         = {2017},
  note         = {Universit{\'e} de Sherbrooke}
}
""",
  :lib => "",
)
get_Dus2_9_nvar(; n::Int = default_nvar, kwargs...) = 1
get_Dus2_9_ncon(; n::Int = default_nvar, kwargs...) = 0
get_Dus2_9_nlin(; n::Int = default_nvar, kwargs...) = 0
get_Dus2_9_nnln(; n::Int = default_nvar, kwargs...) = 0
get_Dus2_9_nequ(; n::Int = default_nvar, kwargs...) = 0
get_Dus2_9_nineq(; n::Int = default_nvar, kwargs...) = 0
