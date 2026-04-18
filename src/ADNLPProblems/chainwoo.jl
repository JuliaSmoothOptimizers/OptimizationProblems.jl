export chainwoo

function chainwoo(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return chainwoo(Val(model); kwargs...)
end

function chainwoo(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_orig = n
  n = 4 * max(1, div(n, 4))
  @adjust_nvar_warn("chainwoo", n_orig, n)
  function f(x; n = length(x))
    return 1 + sum(
      100 * (x[2 * i] - x[2 * i - 1]^2)^2 +
      (1 - x[2 * i - 1])^2 +
      90 * (x[2 * i + 2] - x[2 * i + 1]^2)^2 +
      (1 - x[2 * i + 1])^2 +
      10 * (x[2 * i] + x[2 * i + 2] - 2)^2 +
      1 // 10 * (x[2 * i] - x[2 * i + 2])^2 for i = 1:(div(n, 2) - 1)
    )
  end
  x0 = vcat([-3, -1, -3, -1], -2 * ones(T, n - 4))
  return ADNLPModels.ADNLPModel(f, x0, name = "chainwoo"; kwargs...)
end

function chainwoo(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_orig = n
  n = 4 * max(1, div(n, 4))
  @adjust_nvar_warn("chainwoo", n_orig, n)
  function F!(r, x; n = length(x))
    nb = div(n, 2) - 1
    r[1] = 1
    idx = 2
    @inbounds for i = 1:nb
      r[idx] = 10 * (x[2 * i] - x[2 * i - 1]^2)
      r[idx + 1] = 1 - x[2 * i - 1]
      r[idx + 2] = T(sqrt(90)) * (x[2 * i + 2] - x[2 * i + 1]^2)
      r[idx + 3] = 1 - x[2 * i + 1]
      r[idx + 4] = T(sqrt(10)) * (x[2 * i] + x[2 * i + 2] - 2)
      r[idx + 5] = (x[2 * i] - x[2 * i + 2]) / T(sqrt(10))
      idx += 6
    end
    return r
  end
  nequ = 1 + 6 * (div(n, 2) - 1)
  x0 = vcat([-3, -1, -3, -1], -2 * ones(T, n - 4))
  return ADNLPModels.ADNLSModel!(F!, x0, nequ, name = "chainwoo-nls"; kwargs...)
end
