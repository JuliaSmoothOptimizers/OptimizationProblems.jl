export fminsrf2

function fminsrf2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 4 && @warn("fminsrf2: number of variables must be ≥ 4")
  n = max(4, n)

  p = floor(Int, sqrt(n))
  p * p != n && @warn("fminsrf2: number of variables adjusted from $n down to $(p*p)")
  n = p * p

  h00 = 1
  slopej = 4
  slopei = 8

  scale = (p - 1)^2

  ston = slopei / (p - 1)
  wtoe = slopej / (p - 1)
  h01 = h00 + slopej
  h10 = h00 + slopei
  mid = div(p, 2)

  x0 = zeros(T, p * p)
  I = 2:(p - 1)
  J = 1:p

  x0[I] .= (I .- 1) * ston .+ h01
  x0[I .+ (p .- 1) * p] .= (I .- 1) * ston .+ h00
  x0[1 .+ (J .- 1) * p] .= (J .- 1) * wtoe .+ h00
  x0[p .+ (J .- 1) * p] .= (J .- 1) * wtoe .+ h10
  function f(x)
    n = length(x)
    return sum(
      sum(
        100 * sqrt(
          1 // 2 *
          (p - 1)^2 *
          ((x[i + (j - 1) * p] - x[i + 1 + j * p])^2 + (x[i + 1 + (j - 1) * p] - x[i + j * p])^2) +
          1,
        ) / scale for i = 1:(p - 1)
      ) for j = 1:(p - 1)
    ) + 100 * (x[mid + (mid - 1) * p])^2 / n
  end
  return ADNLPModels.ADNLPModel(f, x0, name = "fminsrf2"; kwargs...)
end
