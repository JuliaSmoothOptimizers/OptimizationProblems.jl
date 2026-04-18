palmer5c_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "palmer5c",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 25494.986780130494,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A linear least squares problem arising from chemical kinetics.

model: H-N=C=Se TZVP+MP2
fitting Y to A0 T_0 + A2 T_2 + A4 T_4 + A6 T_6 + A8 T_8 +
           A10 T_10 + A12 T_12 + A14 T_14
where T_i is the i-th (shifted) Chebyshev polynomial

Source:
M. Palmer, Edinburgh, private communication.

classification QUR2-RN-6-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_palmer5c_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_palmer5c_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5c_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5c_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5c_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5c_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_palmer5c_nls_nequ(; n::Integer = default_nvar, kwargs...) = 12
