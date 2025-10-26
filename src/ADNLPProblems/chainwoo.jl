export chainwoo

function chainwoo(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return chainwoo(Val(model); kwargs...)
end

function chainwoo(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  (n % 4 == 0) || @warn("chainwoo: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))
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
  (n % 4 == 0) || @warn("chainwoo: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))
  function F!(r, x; n = length(x))
    s = one(T)
    nb = div(n, 2) - 1
    @inbounds for i = 1:nb
      i1 = 2 * i - 1
      i2 = 2 * i
      i3 = 2 * i + 1
      i4 = 2 * i + 2
      s += 100 * (x[i2] - x[i1]^2)^2
      s += (one(T) - x[i1])^2
      s += 90 * (x[i4] - x[i3]^2)^2
      s += (one(T) - x[i3])^2
      s += 10 * (x[i2] + x[i4] - T(2))^2
      s += (one(T) / T(10)) * (x[i2] - x[i4])^2
    end
    r[1] = sqrt(s)
    @inbounds for i = 2:n
      r[i] = zero(T)
    end
    return r
  end
  nequ = n
  x0 = vcat([-3, -1, -3, -1], -2 * ones(T, n - 4))
  return ADNLPModels.ADNLSModel!(F!, x0, nequ, name = "chainwoo-nls"; kwargs...)
end
