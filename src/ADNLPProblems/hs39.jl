export hs39

function hs39(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -x[1],
    2ones(T, 4),
    x -> [x[2] - x[1]^3 - x[3]^2; x[1]^2 - x[2] - x[4]^2],
    zeros(T, 2),
    zeros(T, 2),
    name = "hs39_autodiff";
    kwargs...,
  )
end

hs39_meta = Dict(
  :nvar => 4,
  :variable_size => false,
  :ncon => 2,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs39",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :linear,
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

get_hs39_meta(; n::Integer = default_nvar) = (hs39_meta[:nvar], hs39_meta[:ncon])
