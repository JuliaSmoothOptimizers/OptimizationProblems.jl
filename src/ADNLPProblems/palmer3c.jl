export palmer3c

function palmer3c(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return palmer3c(Val(model); kwargs...)
end

function palmer3c(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
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
    64.87939,
    50.46046,
    28.2034,
    13.4575,
    4.6547,
    0.59447,
    0.0000,
    0.2177,
    2.3029,
    5.5191,
    8.5519,
    9.8919,
    8.5519,
    5.5191,
    2.3029,
    0.2177,
    0.0000,
    0.59447,
    4.6547,
    13.4575,
    28.2034,
    50.46046,
    64.87939,
  ]
  function f(x)
    Ti = eltype(x)
    return 1 // 2 * sum((Ti(Y[i]) - sum(x[j] * Ti(X[i])^(2 * j - 2) for j = 1:8))^2 for i = 1:23)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer3c"; kwargs...)
end

function palmer3c(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
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
    64.87939,
    50.46046,
    28.2034,
    13.4575,
    4.6547,
    0.59447,
    0.0000,
    0.2177,
    2.3029,
    5.5191,
    8.5519,
    9.8919,
    8.5519,
    5.5191,
    2.3029,
    0.2177,
    0.0000,
    0.59447,
    4.6547,
    13.4575,
    28.2034,
    50.46046,
    64.87939,
  ]

  function F!(r::AbstractVector{Ti}, x; X = Ti.(X), Y = Ti.(Y)) where {Ti}
    for i = 1:23
      r[i] = Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8)
    end
    return r
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLSModel!(F!, x0, 23, name = "palmer3c-nls"; kwargs...)
end
