export browngen
function browngen(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return browngen(Val(model); kwargs...)
end

function browngen(::Val{:nlp}; n::Int = default_nvar, type::Type = Float64, kwargs...)
  T = type
  function f(x; n = length(x))
    # Placeholder for generalized Brown function (precision-safe)
    s = zero(T)
    for i in 1:n
      t = x[i] - T(0.5)
      s += t * t
    end
    return s
  end
  x0 = ones(T, n) .* T(0.5)
  return ADNLPModels.ADNLPModel(f, x0, name = "browngen"; kwargs...)
end

function browngen(::Val{:nls}; n::Int = default_nvar, type::Type = Float64, kwargs...)
  T = type
  function F!(r, x; n = length(x))
    for i in 1:n
      r[i] = x[i] - T(0.5)
    end
    return r
  end
  x0 = ones(T, n) .* T(0.5)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "browngen-nls"; kwargs...)
end
