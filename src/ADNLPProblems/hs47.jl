export hs47

function hs47(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[2] - x[3])^3 + (x[3] - x[4])^4 + (x[4] - x[5])^4,
    T[2, sqrt(2), -1, 2 - sqrt(2), 0.5],
    x -> [x[1] + x[2]^2 + x[3]^3 - 3; x[2] - x[3]^2 + x[4] - 1; x[1] * x[5] - 1],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs47_autodiff";
    kwargs...,
  )
end

hs47_meta = Dict(
  :nvar => 5,
  :variable_size => false,
  :ncon => 3,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs47",
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

get_hs47_meta(; n::Integer = default_nvar) = (hs47_meta[:nvar], hs47_meta[:ncon])
