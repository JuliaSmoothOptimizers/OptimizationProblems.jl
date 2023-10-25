
export osborne1

function osborne1(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return osborne1(Val(model); kwargs...)
end

function osborne1(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  y = [
    844 // 1000,
    908 // 1000,
    932 // 1000,
    936 // 1000,
    925 // 1000,
    908 // 1000,
    881 // 1000,
    850 // 1000,
    818 // 1000,
    784 // 1000,
    751 // 1000,
    718 // 1000,
    685 // 1000,
    658 // 1000,
    628 // 1000,
    603 // 1000,
    580 // 1000,
    558 // 1000,
    538 // 1000,
    522 // 1000,
    506 // 1000,
    490 // 1000,
    478 // 1000,
    467 // 1000,
    457 // 1000,
    448 // 1000,
    438 // 1000,
    431 // 1000,
    424 // 1000,
    420 // 1000,
    414 // 1000,
    411 // 1000,
    406 // 1000,
  ]

  function f(x)
    m = 33
    return 1 // 2 *
           sum((y[j] - (x[1] + x[2] * exp(-j * x[4]) + x[3] * exp(-j * x[5])))^2 for j = 1:m)
  end
  x0 = T[0.5; 1.5; -1; 0.01; 0.02]
  return ADNLPModels.ADNLPModel(f, x0, name = "osborne1"; kwargs...)
end

function osborne1(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  y = [
    844 // 1000,
    908 // 1000,
    932 // 1000,
    936 // 1000,
    925 // 1000,
    908 // 1000,
    881 // 1000,
    850 // 1000,
    818 // 1000,
    784 // 1000,
    751 // 1000,
    718 // 1000,
    685 // 1000,
    658 // 1000,
    628 // 1000,
    603 // 1000,
    580 // 1000,
    558 // 1000,
    538 // 1000,
    522 // 1000,
    506 // 1000,
    490 // 1000,
    478 // 1000,
    467 // 1000,
    457 // 1000,
    448 // 1000,
    438 // 1000,
    431 // 1000,
    424 // 1000,
    420 // 1000,
    414 // 1000,
    411 // 1000,
    406 // 1000,
  ]

  function F!(r, x)
    m = 33
    for i = 1:m
      r[i] = y[i] - (x[1] + x[2] * exp(-i * x[4]) + x[3] * exp(-i * x[5]))
    end
    return r
  end
  x0 = T[0.5; 1.5; -1; 0.01; 0.02]
  return ADNLPModels.ADNLSModel!(F!, x0, 33, name = "osborne1-nls"; kwargs...)
end
