freuroth_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "freuroth",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 99556.5,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_freuroth_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_freuroth_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nineq(; n::Integer = default_nvar, kwargs...) = 0
