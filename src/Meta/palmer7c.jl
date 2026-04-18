palmer7c_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "palmer7c",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 3.205127217959645e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A linear least squares problem arising from chemical kinetics.

model: H-N=C=Se TZVP+MP2
fitting Y to A0 + A2 X**2 + A4 X**4 + A6 X**6 + A8 X**8 +
           A10 X**10 + A12 X**12 + A14 X**14

Source:
M. Palmer, Edinburgh, private communication.

classification QUR2-RN-8-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_palmer7c_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_palmer7c_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_palmer7c_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_palmer7c_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_palmer7c_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_palmer7c_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_palmer7c_nls_nequ(; n::Integer = default_nvar, kwargs...) = 13
