export hs56 
 
function hs56(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> -x[1] * x[2] * x[3],
    T[
      1.0,
      1.0,
      1.0,
      asin(sqrt(1 / 4.2)),
      asin(sqrt(1 / 4.2)),
      asin(sqrt(1 / 4.2)),
      asin(sqrt(5 / 7.2)),
    ],
    x -> [
      x[1] - T(4.2) * sin(x[4])^2
      x[2] - T(4.2) * sin(x[5])^2
      x[3] - T(4.2) * sin(x[6])^2
      x[1] + 2 * x[2] + 2 * x[3] - 7.2 * sin(x[7])^2
    ],
    zeros(T, 4),
    zeros(T, 4),
    name = "hs56_autodiff";
    kwargs...,
  )
end

hs56_meta = Dict(
  :nvar => 7,
  :variable_size => false,
  :ncon => 4,
  :variable_con_size => false,
  :nnzo => 7,
  :nnzh => 28,
  :nnzj => 28,
  :minimize => true,
  :name => "hs56",
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

get_hs56_meta(; n::Integer = default_nvar) = (hs56_meta[:nvar], hs56_meta[:ncon])
