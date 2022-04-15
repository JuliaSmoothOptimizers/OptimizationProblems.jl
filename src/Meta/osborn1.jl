
osborn1_meta = Dict(
    :nvar => 5,
    :variable_nvar => false,
    :ncon => 33,
    :variable_ncon => false,
    :minimize => true,
    :name => "Osborne1",
    :has_equalities_only => false,
    :has_inequalities_only => false,
    :has_bounds => false,
    :has_fixed_variables => false,
    :objtype => :other,
    :contype => :unconstrained,
    :best_known_lower_bound => 5.46489E-5,
    :best_known_upper_bound => Inf,
    :is_feasible => true,
    :defined_everywhere => missing,
    :origin => :unknown,
  )
  get_orborn1_nvar(; n::Integer = default_nvar, kwargs...) = 5
  get_orborn1_ncon(; n::Integer = default_nvar, kwargs...) = 0
  get_orborn1_nlin(; n::Integer = default_nvar, kwargs...) = 0
  get_orborn1_nnln(; n::Integer = default_nvar, kwargs...) = 0
  get_orborn1_nequ(; n::Integer = default_nvar, kwargs...) = 0
  get_orborn1_nineq(; n::Integer = default_nvar, kwargs...) = 0