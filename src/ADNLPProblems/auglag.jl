export auglag

function auglag(; use_nls::Bool = false, kwargs...)
  model = use_nls ? :nls : :nlp
  return auglag(Val(model); kwargs...)
end

function auglag(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    # Placeholder augmented Lagrangian style objective
    return sum((x[i] - 1)^2 for i = 1:n)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "auglag"; kwargs...)
end
