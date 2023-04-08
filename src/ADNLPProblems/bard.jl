export bard

function bard(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return bard(Val(model); kwargs...)
end

function bard(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  y = Rational{Int}[0.14 0.18 0.22 0.25 0.29 0.32 0.35 0.39 0.37 0.58 0.73 0.16 1.34 2.10 4.39 ];
  function f(x)
    return 1 // 2 * sum(y[i] - (x[1] + i / ((16 - i) * x[2] + min(i, 16 - i) * x[3])) for i = 1:15)
  end
  x0 = ones(T, 3)
  return ADNLPModels.ADNLPModel(f, x0, name = "bard"; kwargs...)
end

function bard(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    y = Rational{Int}[0.14 0.18 0.22 0.25 0.29 0.32 0.35 0.39 0.37 0.58 0.73 0.16 1.34 2.10 4.39 ];
    function F!(r, x, y = y)
    for i=1:15
      r[i] = y[i] - (x[1] + i / ((16 - i) * x[2] + min(i, 16 - i) * x[3]))
    end
    return r
  end
  x0 = ones(T, 3)
  return ADNLPModels.ADNLSModel!(F!, x0, 15, name = "bard-nls"; kwargs...)
end
