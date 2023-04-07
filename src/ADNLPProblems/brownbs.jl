export brownbs

function brownbs(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return brownbs(Val(model); kwargs...)
end

function brownbs(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  function f(x)
    return 1 // 2 * (x[1] - 1000000)^2 +
           1 // 2 * (x[2] - 2 * 1 // 1000000)^2 +
           1 // 2 * (x[1] * x[2] - 2)^2
  end
  x0 = ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, name = "brownbs"; kwargs...)
end

function brownbs(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  function F!(r, x)
    r[1] = x[1] - 1000000
    r[2] = x[2] - 2 * 1 // 1000000
    r[3] = x[1] * x[2] - 2
    return r
  end
  x0 = ones(T, 2)
  return ADNLPModels.ADNLSModel!(F!, x0, 3, name = "brownbs-nls"; kwargs...)
end
