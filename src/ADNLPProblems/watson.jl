export watson

function watson(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return watson(Val(model); kwargs...)
end

function watson(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n = min(max(n, 2), 31)
  function f(x; n = n)
    Ti = eltype(x)
    return 1 // 2 * sum(
             (
               sum((j - 1) * x[j] * (Ti(i) / 29)^(j - 2) for j = 2:n) -
               sum(x[j] * (Ti(i) / 29)^(j - 1) for j = 1:n)^2 - 1
             )^2 for i = 1:29
           ) +
           1 // 2 *
           (
             sum((j - 1) * x[j] * x[1]^(j - 2) for j = 2:n) -
             sum(x[j] * x[1]^(j - 1) for j = 1:n)^2 - 1
           )^2 +
           1 // 2 * (
             sum((j - 1) * x[j] * (x[2] - x[1]^2 - 1)^(j - 2) for j = 2:n) -
             sum(x[j] * (x[2] - x[1]^2 - 1)^(j - 1) for j = 1:n)^2 - 1
           )
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "watson"; kwargs...)
end

function watson(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n = min(max(n, 2), 31)
  function F!(r, x; n = n)
    Ti = eltype(x)
    for i = 1:29
      r[i] =
        sum((j - 1) * x[j] * (Ti(i) / 29)^(j - 2) for j = 2:n) -
        sum(x[j] * (Ti(i) / 29)^(j - 1) for j = 1:n)^2 - 1
    end
    r[30] =
      sum((j - 1) * x[j] * x[1]^(j - 2) for j = 2:n) - sum(x[j] * x[1]^(j - 1) for j = 1:n)^2 - 1
    r[31] =
      sum((j - 1) * x[j] * (x[2] - x[1]^2 - 1)^(j - 2) for j = 2:n) -
      sum(x[j] * (x[2] - x[1]^2 - 1)^(j - 1) for j = 1:n)^2 - 1
    return r
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, 31, name = "watson-nls"; kwargs...)
end
