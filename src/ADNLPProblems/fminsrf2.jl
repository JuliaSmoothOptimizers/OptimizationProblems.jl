export fminsrf2

function fminsrf2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 4 && @warn("fminsrf2: number of variables must be ≥ 4")
  n = max(4, n)

  p = floor(Int, sqrt(n))
  p * p != n && @warn("fminsrf2: number of variables adjusted from $n down to $(p*p)")
  n = p * p

  h00 = 1.0
  slopej = 4.0
  slopei = 8.0

  scale = (p - 1)^2

  ston = slopei / (p - 1)
  wtoe = slopej / (p - 1)
  h01 = h00 + slopej
  h10 = h00 + slopei
  mid = div(p, 2)

  x0 = zeros(p, p)
  I = 2:(p - 1)
  J = 1:p

  x0[I, 1] .= (I .- 1) * ston .+ h01
  x0[I, p] .= (I .- 1) * ston .+ h00
  x0[1, J] .= (J .- 1) * wtoe .+ h00
  x0[p, J] .= (J .- 1) * wtoe .+ h10
  function f(x)
    n = length(x)
    return sum(
      sum(
        100.0 * sqrt(
          0.5 * (p - 1)^2 * ((x[i, j] - x[i + 1, j + 1])^2 + (x[i + 1, j] - x[i, j + 1])^2) + 1.0,
        ) / scale for i = 1:(p - 1)
      ) for j = 1:(p - 1)
    ) + 100.0 * (x[mid, mid])^2 / n
  end
  return ADNLPModels.ADNLPModel(f, x0, name = "fminsrf2"; kwargs...)
end
