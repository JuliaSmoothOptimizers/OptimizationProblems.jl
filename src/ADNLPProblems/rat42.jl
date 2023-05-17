export rat42

function rat42(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return rat42(Val(model); kwargs...)
end

function rat42(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  y = Rational{Int}[
    8.930E0 9.000E0
    10.800E0 14.000E0
    18.590E0 21.000E0
    22.330E0 28.000E0
    39.350E0 42.000E0
    56.110E0 57.000E0
    61.730E0 63.000E0
    64.620E0 70.000E0
    67.080E0 79.000E0
  ]
  function f(x; y = y)
    return 1 // 2 * sum((y[i, 1] - x[1] / (1 + exp(x[2] - x[3] * y[i, 2])))^2 for i = 1:9)
  end
  x0 = T[100, 1, 0.1]
  return ADNLPModels.ADNLPModel(f, x0, name = "rat42"; kwargs...)
end

function rat42(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  y = Rational{Int}[
    8.930E0 9.000E0
    10.800E0 14.000E0
    18.590E0 21.000E0
    22.330E0 28.000E0
    39.350E0 42.000E0
    56.110E0 57.000E0
    61.730E0 63.000E0
    64.620E0 70.000E0
    67.080E0 79.000E0
  ]
  function F!(r, x)
    m = 9
    for i = 1:m
      r[i] = y[i, 1] - x[1] / (1 + exp(x[2] - x[3] * y[i, 2]))
    end
    return r
  end
  x0 = T[100, 1, 0.1]
  return ADNLPModels.ADNLSModel!(F!, x0, 9, name = "rat42-nls"; kwargs...)
end
