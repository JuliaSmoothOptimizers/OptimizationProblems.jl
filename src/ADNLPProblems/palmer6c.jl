export palmer6c

function palmer6c(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return palmer6c(Val(model); kwargs...)
end

function palmer6c(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  X = [
    0.000000,
    1.570796,
    1.396263,
    1.221730,
    1.047198,
    0.872665,
    0.785398,
    0.732789,
    0.698132,
    0.610865,
    0.523599,
    0.349066,
    0.174533,
  ]

  Y = [
    10.678659,
    75.414511,
    41.513459,
    20.104735,
    7.432436,
    1.298082,
    0.171300,
    0.000000,
    0.068203,
    0.774499,
    2.070002,
    5.574556,
    9.026378,
  ]
  function f(x)
    Ti = eltype(x)
    return 1 // 2 * sum((Ti(Y[i]) - sum(x[j] * Ti(X[i])^(2 * j - 2) for j = 1:8))^2 for i = 1:13)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer6c"; kwargs...)
end

function palmer6c(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  X = [
    0.000000,
    1.570796,
    1.396263,
    1.221730,
    1.047198,
    0.872665,
    0.785398,
    0.732789,
    0.698132,
    0.610865,
    0.523599,
    0.349066,
    0.174533,
  ]

  Y = [
    10.678659,
    75.414511,
    41.513459,
    20.104735,
    7.432436,
    1.298082,
    0.171300,
    0.000000,
    0.068203,
    0.774499,
    2.070002,
    5.574556,
    9.026378,
  ]

  function F!(r::AbstractVector{Ti}, x; X = Ti.(X), Y = Ti.(Y)) where {Ti}
    for i = 1:13
      r[i] = Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8)
    end
    return r
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLSModel!(F!, x0, 13, name = "palmer6c-nls"; kwargs...)
end
