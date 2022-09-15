channel_meta = Dict(
  :nvar => 96,
  :variable_nvar => true,
  :ncon => 96,
  :variable_ncon => true,
  :minimize => true,
  :name => "channel",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_channel_nvar(; n::Integer = default_nvar, kwargs...) = 8 * max(2, div(n, 8))
get_channel_ncon(; n::Integer = default_nvar, kwargs...) = 4 * (max(2, div(n, 8)) - 1) + max(2, div(n, 8)) * 4 + 4
get_channel_nlin(; n::Integer = default_nvar, kwargs...) = (max(2, div(n, 8)) - 1) * 4 + 4
get_channel_nnln(; n::Integer = default_nvar, kwargs...) = max(2, div(n, 8)) * 4
get_channel_nequ(; n::Integer = default_nvar, kwargs...) = 4 * (max(2, div(n, 8)) - 1) + max(2, div(n, 8)) * 4 + 4
get_channel_nineq(; n::Integer = default_nvar, kwargs...) = 0
