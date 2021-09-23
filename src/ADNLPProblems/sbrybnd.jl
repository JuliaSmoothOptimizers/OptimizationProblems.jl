function sbrybnd(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("sbrybnd : n ≥ 2")
  p = zeros(T, n)
  J = Array{Any}(undef, n)
  for i = 1:n
    p[i] = exp(6 * (i - 1) / (n - 1))
    J[i] = [max(1, i - 5):(i - 1); (i + 1):min(n, i + 1)]
  end

  function f(x)
    n = length(x)
    return sum(
      (
        (2 + 5 * p[i]^2 * x[i]^2) * p[i] * x[i] + 1 -
        sum(p[j] * x[j] * (1 + p[j] * x[j]) for j in J[i])
      )^2 for i = 1:n
    )
  end
  x0 = T.([1 / p[i] for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "sbrybnd_autodiff"; kwargs...)
end

sbrybnd_meta = Dict(
  :nvar => default_nvar,
  :variable_size => true,
  :ncon => 0,
  :variable_con_size => false,
  :minimize => true,
  :name => "sbrybnd",
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

get_sbrybnd_meta(; n::Integer = default_nvar) = (n, 0)
