export NZF1

function NZF1(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return NZF1(Val(model); kwargs...)
end

function NZF1(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_orig = n
  nbis = max(2, div(n, 13))
  n = 13 * nbis
  (n == n_orig) || @warn("NZF1: number of variables adjusted from $n_orig to $n")
  l = div(n, 13)
  function f(x; l = l)
    return sum(
      (3 * x[i] - 60 + 1 // 10 * (x[i + 1] - x[i + 2])^2)^2 +
      (
        x[i + 1]^2 +
        x[i + 2]^2 +
        (x[i + 3]^2) * (1 + x[i + 3])^2 +
        x[i + 6] +
        x[i + 5] / (1 + x[i + 4]^2 + sin(x[i + 4] / 1000))
      )^2 +
      (x[i + 6] + x[i + 7] - x[i + 8]^2 + x[i + 10])^2 +
      (log(1 + x[i + 10]^2) + x[i + 11] - 5 * x[i + 12] + 20)^2 +
      (x[i + 4] + x[i + 5] + x[i + 5] * x[i + 9] + 10 * x[i + 9] - 50)^2 for i = 1:l
    ) + sum((x[i + 6] - x[i + 19])^2 for i = 1:(l - 1))
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "NZF1"; kwargs...)
end

function NZF1(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_orig = n
  nbis = max(2, div(n, 13))
  n = 13 * nbis
  (n == n_orig) || @warn("NZF1: number of variables adjusted from $n_orig to $n")
  l = div(n, 13)
  function F!(r, x; l = l)
    for i = 1:l
      r[i] = 3 * x[i] - 60 + 1 // 10 * (x[i + 1] - x[i + 2])^2
      r[i + l] =
        x[i + 1]^2 +
        x[i + 2]^2 +
        (x[i + 3]^2) * (1 + x[i + 3])^2 +
        x[i + 6] +
        x[i + 5] / (1 + x[i + 4]^2 + sin(x[i + 4] / 1000))
      r[i + 2l] = x[i + 6] + x[i + 7] - x[i + 8]^2 + x[i + 10]
      r[i + 3l] = log(1 + x[i + 10]^2) + x[i + 11] - 5 * x[i + 12] + 20
      r[i + 4l] = x[i + 4] + x[i + 5] + x[i + 5] * x[i + 9] + 10 * x[i + 9] - 50
    end
    for i = 1:(l - 1)
      r[i + 5l] = x[i + 6] - x[i + 19]
    end
    return r
  end
  x0 = ones(T, n)
  return ADNLPModels.ADNLSModel!(F!, x0, 6l - 1, name = "NZF1-nls"; kwargs...)
end
