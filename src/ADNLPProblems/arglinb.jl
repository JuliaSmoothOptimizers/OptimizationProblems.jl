export arglinb

function arglinb(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return arglinb(Val(model); kwargs...)
end

function arglinb(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    m = 2 * n
    sj = sum(j * x[j] for j = 1:n)
    return 1 // 2 * sum((i * sj - 1)^2 for i = 1:m)
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "arglinb"; kwargs...)
end

function arglinb(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x; n = length(x))
    m = 2 * n
    sj = sum(j * x[j] for j = 1:n)
    for i=1:m
      r[i] = i * sj - 1
    end
    return r
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, 2 * n, name = "arglinb-nls"; kwargs...)
end
