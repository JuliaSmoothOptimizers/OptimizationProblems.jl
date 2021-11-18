fletcbv2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "fletcbv2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.5131082956600861,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_fletcbv2_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_fletcbv2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_fletcbv2_nineq(; n::Integer = default_nvar, kwargs...) = 0
