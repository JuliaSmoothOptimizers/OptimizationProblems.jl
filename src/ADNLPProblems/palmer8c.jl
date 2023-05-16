export palmer8c

function palmer8c(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return palmer8c(Val(model); kwargs...)
end

function palmer8c(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  X = [
    0.000000,
    0.174533,
    0.314159,
    0.436332,
    0.514504,
    0.610865,
    0.785398,
    0.959931,
    1.134464,
    1.308997,
    1.483530,
    1.570796,
  ]

  Y = [
    4.757534,
    3.121416,
    1.207606,
    0.131916,
    0.000000,
    0.258514,
    3.380161,
    10.762813,
    23.745996,
    44.471864,
    76.541947,
    97.874528,
  ]
  function f(x)
    Ti = eltype(x)
    return 1 // 2 * sum((Ti(Y[i]) - sum(x[j] * Ti(X[i])^(2 * j - 2) for j = 1:8))^2 for i = 1:12)
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer8c"; kwargs...)
end

function palmer8c(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  X = [
    0.000000,
    0.174533,
    0.314159,
    0.436332,
    0.514504,
    0.610865,
    0.785398,
    0.959931,
    1.134464,
    1.308997,
    1.483530,
    1.570796,
  ]

  Y = [
    4.757534,
    3.121416,
    1.207606,
    0.131916,
    0.000000,
    0.258514,
    3.380161,
    10.762813,
    23.745996,
    44.471864,
    76.541947,
    97.874528,
  ]
  function F!(r::AbstractVector{Ti}, x; X = Ti.(X), Y = Ti.(Y)) where {Ti}
    for i = 1:12
      r[i] = Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:8)
    end
    return r
  end
  x0 = ones(T, 8)
  return ADNLPModels.ADNLSModel!(F!, x0, 12, name = "palmer8c-nls"; kwargs...)
end
