export palmer7c

function palmer7c(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return palmer7c(Val(model); kwargs...)
end

function palmer7c(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  X = [
    0.000000,
    0.139626,
    0.261799,
    0.436332,
    0.565245,
    0.512942,
    0.610865,
    0.785398,
    0.959931,
    1.134464,
    1.308997,
    1.483530,
    1.658063,
  ]

  Y = [
    4.419446,
    3.564931,
    2.139067,
    0.404686,
    0.000000,
    0.035152,
    0.146813,
    2.718058,
    9.474417,
    26.132221,
    41.451561,
    72.283164,
    117.630959,
  ]
  function f(x)
    Ti = eltype(x)
    return 1 // 2 * sum((Ti(Y[i]) - sum(x[j] * Ti(X[i])^(2 * j - 2) for j = 1:8))^2 for i = 1:13)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer7c"; kwargs...)
end

function palmer7c(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  X = [
    0.000000,
    0.139626,
    0.261799,
    0.436332,
    0.565245,
    0.512942,
    0.610865,
    0.785398,
    0.959931,
    1.134464,
    1.308997,
    1.483530,
    1.658063,
  ]

  Y = [
    4.419446,
    3.564931,
    2.139067,
    0.404686,
    0.000000,
    0.035152,
    0.146813,
    2.718058,
    9.474417,
    26.132221,
    41.451561,
    72.283164,
    117.630959,
  ]
  function F!(r::AbstractVector{Ti}, x; X = Ti.(X), Y = Ti.(Y)) where {Ti}
    for i = 1:13
      r[i] = Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8)
    end
    return r
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLSModel!(F!, x0, 13, name = "palmer7c-nls"; kwargs...)
end
