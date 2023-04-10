export penalty1

function penalty1(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return penalty1(Val(model); kwargs...)
end

function penalty1(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  function f(x; n = length(x), a = eltype(x)(sqrt(1e-5)))
    return 1 // 2 * sum((a * (x[i] - 1))^2 for i = 1:n) +
           1 // 2 * (sum(x[j]^2 for j = 1:n) - 1 // 4)^2
  end
  x0 = T[j for j = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "penalty1"; kwargs...)
end

function penalty1(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  function F!(r, x; n = length(x), a = eltype(x)(sqrt(1e-5)))
    for i = 1:n
      r[i] = a * (x[i] - 1)
    end
    r[n + 1] = sum(x[j]^2 for j = 1:n) - 1 // 4
    return r
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, n + 1, name = "penalty1-nls"; kwargs...)
end
