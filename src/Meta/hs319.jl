hs319_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs319",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :quadratic,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
)
get_hs319_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs319_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs319_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs319_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs319_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs319_nineq(; n::Integer = default_nvar, kwargs...) = 0
