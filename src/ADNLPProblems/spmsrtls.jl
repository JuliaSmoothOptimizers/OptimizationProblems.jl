export spmsrtls

function spmsrtls(;use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return spmsrtls(Val(model); kwargs...)
end

function spmsrtls(::Val{:nlp}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  m = max(Int(round((n + 2) / 3)), 34)
  n = m * 3 - 2
  p = [sin(i^2) for i = 1:n]
  x0 = T[p[i] / 5 for i = 1:n]

  function f(x; p = p)
    p = eltype(x).(p)
    return 1 // 2 * sum(
             (
               x[(3 * (i - 1) + 1) - 4] * x[(3 * (i - 1) + 1) - 1] -
               p[(3 * (i - 1) + 1) - 4] * p[(3 * (i - 1) + 1) - 1]
             )^2 for i = 3:m
           ) +
           1 // 2 * sum(
             (
               x[(3 * (i - 1) + 1) - 3] * x[(3 * (i - 1) + 1) - 1] +
               x[(3 * (i - 1) + 1) - 1] * x[(3 * (i - 1) + 1)] -
               p[(3 * (i - 1) + 1) - 3] * p[(3 * (i - 1) + 1) - 1] -
               p[(3 * (i - 1) + 1) - 1] * p[(3 * (i - 1) + 1)]
             )^2 for i = 2:m
           ) +
           1 // 2 * sum((x[(3 * (i - 1) + 1)]^2 - p[(3 * (i - 1) + 1)]^2)^2 for i = 1:m) +
           1 // 2 * sum(
             (
               x[(3 * (i - 1) + 1) - 2] * x[(3 * (i - 1) + 1) - 1] -
               p[(3 * (i - 1) + 1) - 2] * p[(3 * (i - 1) + 1) - 1]
             )^2 for i = 2:m
           ) +
           1 // 2 * sum(
             (
               x[(3 * (i - 1) + 1) + 2] * x[(3 * (i - 1) + 1) + 1] -
               p[(3 * (i - 1) + 1) + 2] * p[(3 * (i - 1) + 1) + 1]
             )^2 for i = 1:(m - 1)
           ) +
           1 // 2 * sum(
             (
               x[(3 * (i - 1) + 1) + 3] * x[(3 * (i - 1) + 1) + 1] +
               x[(3 * (i - 1) + 1) + 1] * x[(3 * (i - 1) + 1)] -
               p[(3 * (i - 1) + 1) + 3] * p[(3 * (i - 1) + 1) + 1] -
               p[(3 * (i - 1) + 1) + 1] * p[(3 * (i - 1) + 1)]
             )^2 for i = 1:(m - 1)
           ) +
           1 // 2 * sum(
             (
               x[(3 * (i - 1) + 1) + 4] * x[(3 * (i - 1) + 1) + 1] -
               p[(3 * (i - 1) + 1) + 4] * p[(3 * (i - 1) + 1) + 1]
             )^2 for i = 1:(m - 2)
           )
  end
  return ADNLPModels.ADNLPModel(f, x0, name = "spmsrtls"; kwargs...)
end

function spmsrtls(::Val{:nls}; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  m = max(Int(round((n + 2) / 3)), 34)
  n = m * 3 - 2
  p = [sin(i^2) for i = 1:n]
  x0 = T[p[i] / 5 for i = 1:n]

  function F!(r, x; p = p)
    for i = 3:m
      r[i - 2] = x[(3 * (i - 1) + 1) - 4] * x[(3 * (i - 1) + 1) - 1] -
      p[(3 * (i - 1) + 1) - 4] * p[(3 * (i - 1) + 1) - 1]
    end
    for i = 2:m
      r[i + m - 3] = x[(3 * (i - 1) + 1) - 3] * x[(3 * (i - 1) + 1) - 1] +
      x[(3 * (i - 1) + 1) - 1] * x[(3 * (i - 1) + 1)] -
      p[(3 * (i - 1) + 1) - 3] * p[(3 * (i - 1) + 1) - 1] -
      p[(3 * (i - 1) + 1) - 1] * p[(3 * (i - 1) + 1)]
    end
    for i=1:m
      r[i + 2 * m - 3] = x[(3 * (i - 1) + 1)]^2 - p[(3 * (i - 1) + 1)]^2
    end
    for i = 2:m
      r[i + 3 * m - 4] = x[(3 * (i - 1) + 1) - 2] * x[(3 * (i - 1) + 1) - 1] -
      p[(3 * (i - 1) + 1) - 2] * p[(3 * (i - 1) + 1) - 1]
    end
    for i = 1:(m - 1)
      r[i + 4 * m - 4] = x[(3 * (i - 1) + 1) + 2] * x[(3 * (i - 1) + 1) + 1] -
      p[(3 * (i - 1) + 1) + 2] * p[(3 * (i - 1) + 1) + 1]
    end
    for i = 1:(m - 1)
      r[i + 5 * m - 5] = x[(3 * (i - 1) + 1) + 3] * x[(3 * (i - 1) + 1) + 1] +
      x[(3 * (i - 1) + 1) + 1] * x[(3 * (i - 1) + 1)] -
      p[(3 * (i - 1) + 1) + 3] * p[(3 * (i - 1) + 1) + 1] -
      p[(3 * (i - 1) + 1) + 1] * p[(3 * (i - 1) + 1)]
    end
    for i = 1:(m - 2)
      r[i + 6 * m - 6] = x[(3 * (i - 1) + 1) + 4] * x[(3 * (i - 1) + 1) + 1] -
      p[(3 * (i - 1) + 1) + 4] * p[(3 * (i - 1) + 1) + 1]
    end
    return r
  end
  return ADNLPModels.ADNLSModel!(F!, x0, 7 *m - 8, name = "spmsrtls-nls"; kwargs...)
end
