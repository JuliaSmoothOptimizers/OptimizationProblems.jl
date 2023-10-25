export boxbod

function boxbod(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return boxbod(Val(model); kwargs...)
end

function boxbod(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    109 1
    149 2
    149 3
    191 5
    213 7
    224 10
  ]
  function f(x; y = y)
    m = 6
    return 1 // 2 * sum((y[i, 1] - x[1] * (1 - exp(-x[2] * y[i, 2])))^2 for i = 1:m)
  end
  x0 = T[1, 1]
  return ADNLPModels.ADNLPModel(f, x0, name = "boxbod"; kwargs...)
end

function boxbod(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  y = Rational{Int}[
    109 1
    149 2
    149 3
    191 5
    213 7
    224 10
  ]
  function F!(r, x)
    m = 6
    for i = 1:m
      r[i] = y[i, 1] - x[1] * (1 - exp(-x[2] * y[i, 2]))
    end
    return r
  end
  x0 = T[1, 1] # starting value 2 is: T[250, 0.0005]
  return ADNLPModels.ADNLSModel!(F!, x0, 6, name = "boxbod-nls"; kwargs...)
end
