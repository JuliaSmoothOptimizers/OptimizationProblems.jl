export genbroydentri

function genbroydentri(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return genbroydentri(Val(model); kwargs...)
end

function genbroydentri(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  p = 7 // 3
  function f(x; n = length(x))
    x0 = zero(T)
    xn1 = zero(T)
    s = abs((3 - 2 * x[1]) * x[1] - x0 - x[2] + 1)^p
    for i = 2:(n - 1)
      s += abs((3 - 2 * x[i]) * x[i] - x[i - 1] - x[i + 1] + 1)^p
    end
    s += abs((3 - 2 * x[n]) * x[n] - x[n - 1] - xn1 + 1)^p
    return s
  end
  x0 = fill(-one(T), n)
  return ADNLPModels.ADNLPModel(f, x0, name = "genbroydentri"; kwargs...)
end

function genbroydentri(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  p = 7 // 3
  x0 = fill(-one(T), n)
  function F!(r, x)
    x0_val = zero(T)
    xn1_val = zero(T)
    @inbounds begin
      r[1] = abs((3 - 2 * x[1]) * x[1] - x0_val - x[2] + 1)^p
      for i = 2:(n - 1)
        r[i] = abs((3 - 2 * x[i]) * x[i] - x[i - 1] - x[i + 1] + 1)^p
      end
      r[n] = abs((3 - 2 * x[n]) * x[n] - x[n - 1] - xn1_val + 1)^p
    end
    return r
  end
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "genbroydentri-nls"; kwargs...)
end
