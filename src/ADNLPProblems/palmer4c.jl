export palmer4c

function palmer4c(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  X = T[
    -1.658063,
    -1.570796,
    -1.396263,
    -1.221730,
    -1.047198,
    -0.872665,
    -0.766531,
    -0.698132,
    -0.523599,
    -0.349066,
    -0.174533,
    0.0,
    0.174533,
    0.349066,
    0.523599,
    0.698132,
    0.766531,
    0.872665,
    1.047198,
    1.221730,
    1.396263,
    1.570796,
    1.658063,
  ]

  Y = T[
    67.27625,
    52.8537,
    30.2718,
    14.9888,
    5.5675,
    0.92603,
    0.0,
    0.085108,
    1.867422,
    5.014768,
    8.263520,
    9.8046208,
    8.263520,
    5.014768,
    1.867422,
    0.085108,
    0.0,
    0.92603,
    5.5675,
    14.9888,
    30.2718,
    52.8537,
    67.27625,
  ]
  function f(x)
    n = length(x)
    return sum((Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8))^2 for i = 1:23)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer4c"; kwargs...)
end
