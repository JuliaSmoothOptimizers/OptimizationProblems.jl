export palmer2c

function palmer2c(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return palmer2c(Val(model); kwargs...)
end

function palmer2c(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  X = [
    -1.745329,
    -1.570796,
    -1.396263,
    -1.221730,
    -1.047198,
    -0.937187,
    -0.872665,
    -0.698132,
    -0.523599,
    -0.349066,
    -0.174533,
    0.0,
    0.174533,
    0.349066,
    0.523599,
    0.698132,
    0.872665,
    0.937187,
    1.047198,
    1.221730,
    1.396263,
    1.570796,
    1.745329,
  ]

  Y = [
    72.676767,
    40.149455,
    18.8548,
    6.4762,
    0.8596,
    0.00000,
    0.2730,
    3.2043,
    8.1080,
    13.4291,
    17.714,
    19.4529,
    17.7149,
    13.4291,
    8.1080,
    3.2053,
    0.2730,
    0.00000,
    0.8596,
    6.4762,
    18.8548,
    40.149455,
    72.676767,
  ]
  function f(x)
    Ti = eltype(x)
    return 1 // 2 * sum((Ti(Y[i]) - sum(x[j] * Ti(X[i])^(2 * j - 2) for j = 1:8))^2 for i = 1:23)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer2c"; kwargs...)
end

function palmer2c(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  X = [
    -1.745329,
    -1.570796,
    -1.396263,
    -1.221730,
    -1.047198,
    -0.937187,
    -0.872665,
    -0.698132,
    -0.523599,
    -0.349066,
    -0.174533,
    0.0,
    0.174533,
    0.349066,
    0.523599,
    0.698132,
    0.872665,
    0.937187,
    1.047198,
    1.221730,
    1.396263,
    1.570796,
    1.745329,
  ]

  Y = [
    72.676767,
    40.149455,
    18.8548,
    6.4762,
    0.8596,
    0.00000,
    0.2730,
    3.2043,
    8.1080,
    13.4291,
    17.714,
    19.4529,
    17.7149,
    13.4291,
    8.1080,
    3.2053,
    0.2730,
    0.00000,
    0.8596,
    6.4762,
    18.8548,
    40.149455,
    72.676767,
  ]
  function F!(
    r::AbstractVector{Ti},
    x;
    X = Ti.(X),
    Y = Ti.(Y),
  ) where {Ti}
    for i = 1:23
      r[i] = Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8)
    end
    return r
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLSModel!(F!, x0, 23, name = "palmer2c-nls"; kwargs...)
end
