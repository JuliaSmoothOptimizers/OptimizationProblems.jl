marine_meta = Dict(
  :nvar => 111,
  :variable_nvar => true,
  :ncon => 40,
  :variable_ncon => true,
  :minimize => true,
  :name => "marine",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_marine_nvar(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  8 + 7 + Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 3 * 8 * nc)
get_marine_ncon(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 2 * nc + nc * (8 - 2)) - 8
get_marine_nlin(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  8 * (Int(round((n - 2 * 8 + 1) / (3 * 8 * 1 + 8))) - 1) # (nh - 1) * ne
get_marine_nnln(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (2 * nc + nc * (8 - 2))
get_marine_nequ(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 2 * nc + nc * (8 - 2)) - 8
get_marine_nineq(; n::Integer = default_nvar, nc::Int = 1, kwargs...) = 0
