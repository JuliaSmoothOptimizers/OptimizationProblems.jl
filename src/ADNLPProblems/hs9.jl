function hs9(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> sin(π * x[1] / 12) * cos(π * x[2] / 16),
    zeros(T, 2),
    x -> [4 * x[1] - 3 * x[2]],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs9_autodiff";
    kwargs...,
  )
end

hs9_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 1,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs9",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :other,
  :contype => :linear,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_hs9_meta(; n::Integer = default_nvar) = (hs9_meta[:nvar], hs9_meta[:ncon])
