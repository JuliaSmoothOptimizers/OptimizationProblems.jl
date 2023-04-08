export brownal

function brownal(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return brownal(Val(model); kwargs...)
end

function brownal(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    sj = sum(x[j] for j = 1:n)
    pj = prod(x[j] for j = 1:n)
    return 1 // 2 * sum((x[i] + sj - (n + 1))^2 for i = 1:(n-1)) + 1 // 2 * (pj - 1)^2
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "brownal"; kwargs...)
end

function brownal(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function F!(r, x)
    sj = sum(x[j] for j = 1:n)
    for i=1:(n-1)
      r[i] = x[i] + sj - (n + 1)
    end
    r[n] = prod(x[j] for j = 1:n) - 1
    return r
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "brownal-nls"; kwargs...)
end
