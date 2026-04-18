palmer5d_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "palmer5d",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 22262.593390708807,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A linear least squares problem arising from chemical kinetics.

model: H-N=C=Se TZVP+MP2
fitting Y to to A0 + A2 X**2 + A4 X**4 + A6 X**6

Source:
M. Palmer, Edinburgh, private communication.

classification QUR2-RN-4-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_palmer5d_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_palmer5d_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5d_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5d_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5d_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5d_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5d_nls_nequ(; n::Integer = default_nvar, kwargs...) = 12
