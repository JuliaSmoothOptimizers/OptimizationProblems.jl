export danwood

function danwood(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return danwood(Val(model); kwargs...)
end

function danwood(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    2.138E0 1.309E0
    3.421E0 1.471E0
    3.597E0 1.490E0
    4.340E0 1.565E0
    4.882E0 1.611E0
    5.660E0 1.680E0
  ]
  function f(x; y = y)
    m = 6
    return 1 // 2 * sum((y[i, 1] - x[1] * y[i, 1]^(x[2]))^2 for i = 1:6)
  end
  x0 = T[1, 5]
  return ADNLPModels.ADNLPModel(f, x0, name = "danwood"; kwargs...)
end

function danwood(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    2.138E0 1.309E0
    3.421E0 1.471E0
    3.597E0 1.490E0
    4.340E0 1.565E0
    4.882E0 1.611E0
    5.660E0 1.680E0
  ]
  function F!(r, x)
    m = 6
    for i = 1:m
      r[i] = y[i, 1] - x[1] * y[i, 1]^(x[2])
    end
    return r
  end
  x0 = T[1, 5]
  return ADNLPModels.ADNLSModel!(F!, x0, 6, name = "danwood-nls"; kwargs...)
end
