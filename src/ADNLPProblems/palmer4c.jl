export palmer4c

function palmer4c(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return palmer4c(Val(model); kwargs...)
end

function palmer4c(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  X = [
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

  Y = [
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
    Ti = eltype(x)
    return 1 // 2 * sum((Ti(Y[i]) - sum(x[j] * Ti(X[i])^(2 * j - 2) for j = 1:8))^2 for i = 1:23)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer4c"; kwargs...)
end

function palmer4c(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  X = [
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

  Y = [
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

  function F!(r::AbstractVector{Ti}, x; X = Ti.(X), Y = Ti.(Y)) where {Ti}
    for i = 1:23
      r[i] = Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8)
    end
    return r
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLSModel!(F!, x0, 23, name = "palmer4c"; kwargs...)
end
