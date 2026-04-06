griewank_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "griewank",
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
  :origin => :unknown,
)
get_griewank_nvar(; n::Integer = default_nvar, kwargs...) = n
get_griewank_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_griewank_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_griewank_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_griewank_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_griewank_nineq(; n::Integer = default_nvar, kwargs...) = 0
