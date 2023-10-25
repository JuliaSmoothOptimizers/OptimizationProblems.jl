export dixon3dq

function dixon3dq(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return dixon3dq(Val(model); kwargs...)
end

function dixon3dq(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  function f(x; n = length(x))
    return 1 // 2 * (x[1] - 1)^2 +
           1 // 2 * (x[n] - 1)^2 +
           1 // 2 * sum((x[i] - x[i + 1])^2 for i = 2:(n - 1))
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "dixon3dq"; kwargs...)
end

function dixon3dq(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  function F!(r, x; n = length(x))
    r[1] = x[1] - 1
    r[2] = x[n] - 1
    for i = 2:(n - 1)
      r[i + 1] = x[i] - x[i + 1]
    end
    return r
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "dixon3dq-nls"; kwargs...)
end
