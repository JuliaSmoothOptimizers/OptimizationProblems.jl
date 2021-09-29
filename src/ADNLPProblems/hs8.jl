export hs8

function hs8(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -T(1),
    T[2.0; 1.0],
    x -> [x[1]^2 + x[2]^2 - 25; x[1] * x[2] - 9],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs8_autodiff";
    kwargs...,
  )
end

hs8_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs8",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :constant,
  :contype => :quadratic,
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

get_hs8_meta(; n::Integer = default_nvar) = (hs8_meta[:nvar], hs8_meta[:ncon])
