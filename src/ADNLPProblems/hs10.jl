export hs10

function hs10(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T[-10; 10]
  f(x) = x[1] - x[2]
  c(x) = T[-3 * x[1]^2 + 2 * x[1] * x[2] - x[2]^2 + 1]
  lcon = T[0.0]
  ucon = T[Inf]

  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs10_autodiff"; kwargs...)
end

hs10_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 1,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs10",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :linear,
  :contype => :quadratic,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_hs10_meta(; n::Integer = default_nvar) = (hs10_meta[:nvar], hs10_meta[:ncon])
