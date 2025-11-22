trig_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "trig",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)

get_trig_nvar(; n::Integer = default_nvar, kwargs...) = n
get_trig_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nineq(; n::Integer = default_nvar, kwargs...) = 0
