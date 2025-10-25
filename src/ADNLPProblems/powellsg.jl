export powellsg

function powellsg(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return powellsg(Val(model); kwargs...)
end

function powellsg(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  (n % 4 == 0) || @warn("powellsg: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
  function f(x; n = length(x))
    return sum(
      (x[j] + 10 * x[j + 1])^2 +
      5 * (x[j + 2] - x[j + 3])^2 +
      (x[j + 1] - 2 * x[j + 2])^4 +
      10 * (x[j] - x[j + 3])^4 for j = 1:4:n
    )
  end
  x0 = zeros(T, n)
  x0[4 * (collect(1:div(n, 4))) .- 3] .= 3
  x0[4 * (collect(1:div(n, 4))) .- 2] .= -1
  x0[4 * (collect(1:div(n, 4)))] .= 1
  return ADNLPModels.ADNLPModel(f, x0, name = "powellsg"; kwargs...)
end

function powellsg(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  (n % 4 == 0) || @warn("powellsg: number of variables adjusted to be a multiple of 4")
  n = 4 * max(1, div(n, 4))
  function F!(r, x; n = length(x))
    @inbounds for j = 1:4:n
      r[j] = x[j] + 10 * x[j + 1]
      r[j + 1] = T(sqrt(5)) * (x[j + 2] - x[j + 3])
      r[j + 2] = (x[j + 1] - 2 * x[j + 2])^2
      r[j + 3] = T(sqrt(10)) * (x[j] - x[j + 3])^2
    end
    return r
  end
  x0 = zeros(T, n)
  x0[4 * (collect(1:div(n, 4))) .- 3] .= 3
  x0[4 * (collect(1:div(n, 4))) .- 2] .= -1
  x0[4 * (collect(1:div(n, 4)))] .= 1
  return ADNLPModels.ADNLSModel!(F!, x0, n, name = "powellsg-nls"; kwargs...)
end
