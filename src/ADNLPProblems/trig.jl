export prob09_trig

function prob09_trig(::Val{:nlp}; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    return sum((sin(x[i]) + 0.5 * x[i])^2 for i = 1:n)
  end
  x0 = zeros(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "prob09_trig"; kwargs...)
end
