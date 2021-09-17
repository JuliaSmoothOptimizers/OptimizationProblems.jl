function hs50(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> (x[1] - x[2])^2 + (x[2] - x[3])^2 + (x[3] - x[4])^4 + (x[4] - x[5])^2,
    T[35, -31, 11, 5, -5],
    x -> [
      x[1] + 2 * x[2] + 3 * x[3] - 6
      x[2] + 2 * x[3] + 3 * x[4] - 6
      x[3] + 2 * x[4] + 3 * x[5] - 6
    ],
    zeros(T, 3),
    zeros(T, 3),
    name = "hs50_autodiff";
    kwargs...,
  )
end

hs50_meta = Dict(
  :nvar => 5,
  :variable_size => false,
  :ncon => 3,
  :variable_con_size => false,
  :nnzo => 5,
  :nnzh => 15,
  :nnzj => 15,
  :minimize => true,
  :name => "hs50",
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

get_hs50_meta(; n::Integer = default_nvar) = (hs50_meta[:nvar], hs50_meta[:ncon])
