export mgh09

function mgh09(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return mgh09(Val(model); kwargs...)
end

function mgh09(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
y = Rational{Int}[
  1957 // 10000    4
  1947 // 10000    2
  1735 // 10000    1
  1600 // 10000    05000 // 10000
  08440 // 100000    2500 // 10000
  06270 // 100000    1670 // 10000
  4560 // 100000    1250 // 10000
  3420 // 100000    1000 // 10000
  3230 // 100000    8330 // 100000
  2350 // 100000    07140 // 100000
  2460 // 100000    06250 // 100000
]
  function f(x; y = y)
    m = 11
    return 1 // 2 * sum((y[i, 1] - (x[1]*(y[i, 2]^2+y[i, 2]*x[2]) / (y[i, 2]^2+y[i, 2]*x[3]+x[4])))^2 for i = 1:11)
  end
  x0 = T[25, 39, 41.5, 39]
  return ADNLPModels.ADNLPModel(f, x0, name = "mgh09"; kwargs...)
end

function mgh09(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
y = Rational{Int}[
  1957 // 10000    4
  1947 // 10000    2
  1735 // 10000    1
  1600 // 10000    05000 // 10000
  08440 // 100000    2500 // 10000
  06270 // 100000    1670 // 10000
  4560 // 100000    1250 // 10000
  3420 // 100000    1000 // 10000
  3230 // 100000    8330 // 100000
  2350 // 100000    07140 // 100000
  2460 // 100000    06250 // 100000
]
  function F!(r, x)
    m = 11
    for i = 1:m
      r[i] = y[i, 1] - (x[1]*(y[i, 2]^2+y[i, 2]*x[2]) / (y[i, 2]^2+y[i, 2]*x[3]+x[4]))
    end
    return r
  end
  x0 = T[25, 39, 41.5, 39]
  return ADNLPModels.ADNLSModel!(F!, x0, 11, name = "mgh09-nls"; kwargs...)
end
