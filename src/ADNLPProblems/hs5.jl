export hs5 
 
function hs5(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = zeros(T, 2)
  f(x) = sin(x[1] + x[2]) + (x[1] - x[2])^2 - 3x[1] / 2 + 5x[2] / 2 + 1
  l = T[-1.5; -3.0]
  u = T[4.0; 3.0]

  return ADNLPModels.ADNLPModel(f, x0, l, u, name = "hs5_autodiff"; kwargs...)
end

hs5_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 2,
  :nnzh => 3,
  :nnzj => 0,
  :minimize => true,
  :name => "hs5",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :other,
  :contype => :general,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_hs5_meta(; n::Integer = default_nvar) = (hs5_meta[:nvar], hs5_meta[:ncon])
