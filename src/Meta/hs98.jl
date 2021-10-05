hs98_meta = Dict(
  :nvar => 6,
  :variable_size => false,
  :ncon => 4,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs98",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :has_cvx_obj => missing,
  :has_cvx_con => missing,
  :cqs => 0,
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :not_everywhere_defined => missing,
  :origin => :unknown,
  :deriv => UInt8(0),
)

get_hs98_meta(; n::Integer = default_nvar) = (6, 4)
