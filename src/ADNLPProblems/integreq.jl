export integreq

function integreq(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return integreq(Val(model); kwargs...)
end

function integreq(
  ::Val{:nlp};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  function f(x; n = length(x))
    h = 1 // (n + 1)
    return 1 // 2 * sum(
      (
        x[i] +
        h * (
          (1 - i * h) * sum(j * h * (x[j] + j * h + 1)^3 for j = 1:i) +
          i * h * sum((1 - j * h) * (x[j] + j * h + 1)^3 for j = (i + 1):n)
        ) / 2
      )^2 for i = 1:(n - 1)
    ) + 1 // 2 * (x[n] + h * ((1 - n * h) * sum(j * h * (x[j] + j * h + 1)^3 for j = 1:n)) / 2)^2
  end
  x0 = T[j * (1 / (n + 1)) * (j * (1 / (n + 1)) - 1) for j = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "integreq"; kwargs...)
end

function integreq(
  ::Val{:nls};
  n::Int = default_nvar,
  type::Type{T} = Float64,
  kwargs...,
) where {T}
  function F!(r, x; n = length(x))
    h = 1 // (n + 1)
    for i = 1:(n - 1)
      r[i] =
        x[i] +
        h * (
          (1 - i * h) * sum(j * h * (x[j] + j * h + 1)^3 for j = 1:i) +
          i * h * sum((1 - j * h) * (x[j] + j * h + 1)^3 for j = (i + 1):n)
        ) / 2
    end
    r[n] = x[n] + h * ((1 - n * h) * sum(j * h * (x[j] + j * h + 1)^3 for j = 1:n)) / 2
    return r
  end
  x0 = T[j * (1 / (n + 1)) * (j * (1 / (n + 1)) - 1) for j = 1:n]
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "integreq-nls"; kwargs...)
end
