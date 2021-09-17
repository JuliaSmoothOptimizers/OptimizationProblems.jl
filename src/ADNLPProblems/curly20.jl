function curly20(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("curly: number of variables must be ≥ 2")
  n = max(2, n)
  b = 20
  function f(x)
    n = length(x)
    return sum(
      (sum(x[j] for j = i:min(i + b, n))) *
      ((sum(x[j] for j = i:min(i + b, n))) * ((sum(x[j] for j = i:min(i + b, n)))^2 - 20) - T(0.1))
      for i = 1:n
    )
  end
  x0 = T[1.0e-4 * i / (n + 1) for i = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "curly20_autodiff"; kwargs...)
end

curly20_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :nnzo => 100,
  :nnzh => 5050,
  :nnzj => 0,
  :minimize => true,
  :name => "curly20",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :other,
  :contype => :unconstrained,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_curly20_meta(; n::Integer = default_nvar) = (n, 0)
