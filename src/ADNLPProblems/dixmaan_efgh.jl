export dixmaane, dixmaanf, dixmaang, dixmaanh

function dixmaane(;
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  α = 1,
  β = 0,
  γ = 0.125,
  δ = 0.125,
  kwargs...,
) where {T}
  (n % 3 == 0) || @warn("dixmaan: number of variables adjusted to be a multiple of 3")
  m = max(1, div(n, 3))
  n = 3 * m
  function f(x; n = length(x), α = α, β = β, γ = γ, δ = δ)
    Ti = eltype(x)
    return 1 +
           sum(i // n * Ti(α) * x[i]^2 for i = 1:n) +
           sum(Ti(β) * x[i]^2 * (x[i + 1] + x[i + 1]^2)^2 for i = 1:(n - 1)) +
           sum(Ti(γ) * x[i]^2 * x[i + m]^4 for i = 1:(2 * m)) +
           sum(i // n * Ti(δ) * x[i] * x[i + 2 * m] for i = 1:m)
  end
  x0 = 2 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "dixmaane"; kwargs...)
end

dixmaanf(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T} = dixmaane(
  n = n,
  type = type,
  α = one(T),
  β = T(0.0625),
  γ = T(0.0625),
  δ = T(0.0625),
  name = "dixmaanf";
  kwargs...,
)

dixmaang(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T} = dixmaane(
  n = n,
  type = type,
  α = one(T),
  β = T(0.125),
  γ = T(0.125),
  δ = T(0.125),
  name = "dixmaang";
  kwargs...,
)

dixmaanh(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T} = dixmaane(
  n = n,
  type = type,
  α = one(T),
  β = T(0.26),
  γ = T(0.26),
  δ = T(0.26),
  name = "dixmaanh";
  kwargs...,
)
