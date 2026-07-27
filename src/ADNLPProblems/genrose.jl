export genrose, rosenbrock

function genrose(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return genrose(Val(model); kwargs...)
end

function genrose(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(2, n)
  @adjust_nvar_warn("genrose", n_org, n)
  function f(x; n = length(x))
    return 1 +
           100 * sum((x[i + 1] - x[i]^2)^2 for i = 1:(n - 1)) +
           sum((x[i] - 1)^2 for i = 1:(n - 1))
  end
  x0 = T.([i / (n + 1) for i = 1:n])
  return ADNLPModels.ADNLPModel(f, x0, name = "genrose"; kwargs...)
end

function genrose(::Val{:nls}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_org = n
  n = max(2, n)
  @adjust_nvar_warn("genrose", n_org, n)
  nequ = 2 * (n - 1) + 1
  function F!(r, x; n = length(x))
    @inbounds begin
      r[1] = 1
      for i = 1:(n - 1)
        r[i + 1] = 10 * (x[i + 1] - x[i]^2)
        r[i + n] = x[i] - 1
      end
    end
    return r
  end
  x0 = T.([i / (n + 1) for i = 1:n])
  return ADNLPModels.ADNLSModel!(F!, x0, nequ, name = "genrose-nls"; kwargs...)
end

function rosenbrock(; use_nls::Bool = false, kwargs...)
  name = use_nls ? "rosenbrock-nls" : "rosenbrock"
  kw = delete!(delete!(Dict{Symbol, Any}(kwargs), :n), :name)
  return genrose(; use_nls = use_nls, n = 2, name = name, kw...)
end
