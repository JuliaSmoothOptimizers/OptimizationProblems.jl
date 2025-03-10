chebyquad_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "chebyquad",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_chebyquad_nvar(; n::Integer = default_nvar, kwargs...) = n
get_chebyquad_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_chebyquad_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_chebyquad_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_chebyquad_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_chebyquad_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_chebyquad_nls_nequ(; n::Integer = default_nvar, m::Int = n, kwargs...) = m
