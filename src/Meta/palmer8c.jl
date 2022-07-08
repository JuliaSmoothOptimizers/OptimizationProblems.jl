palmer8c_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "palmer8c",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 850271.0403558624,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_palmer8c_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_palmer8c_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_palmer8c_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_palmer8c_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_palmer8c_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_palmer8c_nineq(; n::Integer = default_nvar, kwargs...) = 0
