export hs40 
 
function hs40(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -x[1] * x[2] * x[3] * x[4],
    T(0.8) * ones(T, 4),
    x -> [x[1]^3 + x[2]^2 - 1; x[4] * x[1]^2 - x[3]; x[4]^2 - x[2]],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs40_autodiff";
    kwargs...,
  )
end

hs40_meta = Dict(
  :nvar => 4,
  :variable_size => false,
  :ncon => 3,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs40",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :other,
  :contype => :general,
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

get_hs40_meta(; n::Integer = default_nvar) = (hs40_meta[:nvar], hs40_meta[:ncon])
