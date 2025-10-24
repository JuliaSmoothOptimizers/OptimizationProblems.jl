export genrose, rosenbrock

function genrose(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return genrose(Val(model); kwargs...)
end

function genrose(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n < 2 && @warn("genrose: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x; n = length(x))
    return 1 +
           100 * sum((x[i + 1] - x[i]^2)^2 for i = 1:(n - 1)) +
           sum((x[i] - 1)^2 for i = 1:(n - 1))
  end
  x0 = T.([i / (n + 1) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "genrose"; kwargs...)
end

function genrose(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n = max(2, n)
  nequ = n - 1
  function F!(r, x; n = length(x))
    @inbounds r[1] = x[2] - x[1]^2
    @inbounds for i = 2:nequ
      r[i] = x[i + 1] - x[i]^2
    end
    return r
  end
  x0 = T.([i // (n + 1) for i = 1:n])
  return ADNLPModels.ADNLSModel!(F!, x0, nequ, name = "genrose-nls"; kwargs...)
end

rosenbrock(args...; kwargs...) =
  genrose(args..., n = 2, name = "rosenbrock"; delete!(Dict(kwargs), :n)...)
