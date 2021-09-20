function cragglvy(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("cragglvy : n ≥ 2")
  function f(x)
    n = length(x)
    return sum(
      (exp(x[2 * i - 1]) - x[2 * i])^4 +
      100 * (x[2 * i] - x[2 * i + 1])^6 +
      (tan(x[2 * i + 1] - x[2 * i + 2]) + x[2 * i + 1] - x[2 * i + 2])^4 +
      x[2 * i - 1]^8 +
      (x[2 * i + 2] - 1)^2 for i = 1:(div(n, 2) - 1)
    )
  end
  x0 = 2 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "cragglvy_autodiff"; kwargs...)
end

cragglvy_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "cragglvy",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => false,
  :objtype => :other,
  :contype => :unconstrained,
  :origin => :unknown,
  :deriv => UInt8(1), # gradient not defined in [0, 0, pi/2, 0]
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_cragglvy_meta(; n::Integer = default_nvar) = (n, 0)
