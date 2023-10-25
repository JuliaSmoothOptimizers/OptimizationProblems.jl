export misra1a

function misra1a(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return misra1a(Val(model); kwargs...)
end

function misra1a(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    10.07E0 77.6E0
    14.73E0 114.9E0
    17.94E0 141.1E0
    23.93E0 190.8E0
    29.61E0 239.9E0
    35.18E0 289.0E0
    40.02E0 332.8E0
    44.82E0 378.4E0
    50.76E0 434.8E0
    55.05E0 477.3E0
    61.01E0 536.8E0
    66.40E0 593.1E0
    75.47E0 689.1E0
    81.78E0 760.0E0
  ]
  function f(x; y = y)
    m = 14
    return 1 // 2 * sum((y[i, 1] - x[1] * (1 - exp(-x[2] * y[i, 2])))^2 for i = 1:m)
  end
  x0 = T[500, 0.0001] # starting value 2 is: T[250, 0.0005]
  return ADNLPModels.ADNLPModel(f, x0, name = "misra1a"; kwargs...)
end

function misra1a(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    10.07E0 77.6E0
    14.73E0 114.9E0
    17.94E0 141.1E0
    23.93E0 190.8E0
    29.61E0 239.9E0
    35.18E0 289.0E0
    40.02E0 332.8E0
    44.82E0 378.4E0
    50.76E0 434.8E0
    55.05E0 477.3E0
    61.01E0 536.8E0
    66.40E0 593.1E0
    75.47E0 689.1E0
    81.78E0 760.0E0
  ]
  function F!(r, x)
    m = 14
    for i = 1:m
      r[i] = y[i, 1] - x[1] * (1 - exp(-x[2] * y[i, 2]))
    end
    return r
  end
  x0 = T[500, 0.0001] # starting value 2 is: T[250, 0.0005]
  return ADNLPModels.ADNLSModel!(F!, x0, 14, name = "misra1a-nls"; kwargs...)
end
