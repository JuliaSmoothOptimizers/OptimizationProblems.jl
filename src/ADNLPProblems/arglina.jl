export arglina

function arglina(;use_nls = false, kwargs...)
  model = use_nls ? :nls : nlp
  return arglina(Val(model); kwargs...)
end

function arglina(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    m = 2 * n
    sj = sum(x[j] for j = 1:n)
    return sum((x[i] - 2 // m * sj - 1)^2 for i = 1:n) + sum((-2 // m * sj - 1)^2 for i = (n + 1):m)
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "arglina"; kwargs...)
end

function arglina(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    m = 2 * n
    sj = sum(x[j] for j = 1:n)
    for i=1:n
      r[i] = x[i] - 2 // m * sj - 1
      r[i + n] = - 2 // m * sj - 1
    end
    return r
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, 2 * n, name = "arglina-nls"; kwargs...)
end
