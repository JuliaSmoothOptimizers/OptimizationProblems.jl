export dixmaanm, dixmaann, dixmaano, dixmaanp

function dixmaanm(;
  n::Int = default_nvar,
  type::Type{T} = Float64,
  α = 1,
  β = 0,
  γ = 125 // 1000,
  δ = 125 // 1000,
  kwargs...,
) where {T}
  (n % 3 == 0) || @warn("dixmaan: number of variables adjusted to be a multiple of 3")
  m = max(1, div(n, 3))
  n = 3 * m
  function f(x; n = length(x), α = α, β = β, γ = γ, δ = δ)
    return 1 +
           sum((i // n)^2 * α * x[i]^2 for i = 1:n) +
           sum((i // n) * β * x[i]^2 * (x[i + 1] + x[i + 1]^2)^2 for i = 1:(n - 1)) +
           sum((i // n) * γ * x[i]^2 * x[i + m]^4 for i = 1:(2 * m)) +
           sum((i // n)^2 * δ * x[i] * x[i + 2 * m] for i = 1:m)
  end
  x0 = 2 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "dixmaanm"; kwargs...)
end

dixmaann(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T} = dixmaanm(
  n = n,
  type = type,
  α = 1,
  β = 625 // 10000,
  γ = 625 // 10000,
  δ = 625 // 10000,
  name = "dixmaann";
  kwargs...,
)

dixmaano(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T} = dixmaanm(
  n = n,
  type = type,
  α = 1,
  β = 125 // 1000,
  γ = 125 // 1000,
  δ = 125 // 1000,
  name = "dixmaano";
  kwargs...,
)

dixmaanp(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T} = dixmaanm(
  n = n,
  type = type,
  α = 1,
  β = 26 // 100,
  γ = 26 // 100,
  δ = 26 // 100,
  name = "dixmaanp";
  kwargs...,
)
