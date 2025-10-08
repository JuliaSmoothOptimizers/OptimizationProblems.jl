export prob11_auglag

function prob11_auglag(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    # Placeholder augmented Lagrangian style objective
    return sum((x[i] - 1)^2 for i = 1:n)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "prob11_auglag"; kwargs...)
end
