export broyden3d

function broyden3d(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return broyden3d(Val(model); kwargs...)
end

function broyden3d(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    return 1 // 2 * sum(((3 - 2 * x[i]) * x[i] - x[i - 1] - 2 * x[i + 1] + 1)^2 for i = 2:(n - 1)) +
           1 // 2 * ((3 - 2 * x[1]) * x[1] - 2 * x[2] + 1)^2 +
           1 // 2 * ((3 - 2 * x[n]) * x[n] - x[n - 1] + 1)^2
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "broyden3d"; kwargs...)
end

function broyden3d(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function F!(r, x; n = length(x))
    r[1] = (3 - 2 * x[1]) * x[1] - 2 * x[2] + 1
    r[n] = (3 - 2 * x[n]) * x[n] - x[n - 1] + 1
    for i = 2:(n - 1)
      r[i] = (3 - 2 * x[i]) * x[i] - x[i - 1] - 2 * x[i + 1] + 1
    end
    return r
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "broyden3d-nls"; kwargs...)
end
