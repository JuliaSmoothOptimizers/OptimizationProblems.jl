export broyden7d

function broyden7d(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return broyden7d(Val(model); kwargs...)
end

function broyden7d(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  p = T(7) / T(3)
  function f(x; n = length(x))
    x0 = zero(T)
    xn1 = zero(T)
    s = zero(T)
    s += abs((3 - 2 * x[1]) * x[1] - x0 - x[2] + 1)^p
    for i = 2:(n - 1)
      s += abs((3 - 2 * x[i]) * x[i] - x[i - 1] - x[i + 1] + 1)^p
    end
    s += abs((3 - 2 * x[n]) * x[n] - x[n - 1] - xn1 + 1)^p
    nh = div(n, 2)
    for i = 1:nh
      s += abs(x[i] + x[i + nh])^p
    end
    return s
  end
  x0 = fill(-one(T), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "broyden7d"; kwargs...)
end

function broyden7d(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  p = T(7) / T(3)
  x0 = fill(-one(T), n)
  nh = div(n, 2)
  function F!(r, x)
    @inbounds begin
      r[1] = abs((3 - 2 * x[1]) * x[1] - zero(T) - x[2] + 1)^p
      for i = 2:(n - 1)
        r[i] = abs((3 - 2 * x[i]) * x[i] - x[i - 1] - x[i + 1] + 1)^p
      end
      r[n] = abs((3 - 2 * x[n]) * x[n] - x[n - 1] - zero(T) + 1)^p
      for i = 1:nh
        r[n + i] = abs(x[i] + x[i + nh])^p
      end
    end
    return r
  end
  return ADNLPModels.ADNLSModel!(F!, x0, n + nh, name = "broyden7d-nls"; kwargs...)
end
