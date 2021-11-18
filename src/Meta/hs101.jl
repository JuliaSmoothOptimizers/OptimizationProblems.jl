hs101_meta = Dict(
  :nvar => 7,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs101",
  :has_equalities_only => false,
  :has_inequalities_only => true,
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
get_hs101_nvar(; n::Integer = default_nvar, kwargs...) = 7
get_hs101_ncon(; n::Integer = default_nvar, kwargs...) = 5
get_hs101_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs101_nnln(; n::Integer = default_nvar, kwargs...) = 5
get_hs101_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs101_nineq(; n::Integer = default_nvar, kwargs...) = 5
