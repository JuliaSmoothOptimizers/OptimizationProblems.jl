function hs48(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - 1)^2 + (x[2] - x[3])^2 + (x[4] - x[5])^2,
    T[3, 5, -3, 2, -2],
    x -> [x[1] + x[2] + x[3] + x[4] + x[5] - 5; x[3] - 2 * (x[4] + x[5]) + 3],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs48_autodiff";
    kwargs...,
  )
end

hs48_meta = Dict(
  :nvar => 5,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs48",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :quadratic,
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

get_hs48_meta(; n::Integer = default_nvar) = (hs48_meta[:nvar], hs48_meta[:ncon])
