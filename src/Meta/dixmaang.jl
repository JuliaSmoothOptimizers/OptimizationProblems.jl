dixmaang_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaang",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2495.8333333333335,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_dixmaang_nvar(; n::Integer = default_nvar, kwargs...) = 3 * max(1, div(n, 3))
get_dixmaang_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nineq(; n::Integer = default_nvar, kwargs...) = 0
