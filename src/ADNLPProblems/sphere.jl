export sphere

function sphere(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return sum(x[i]^2 for i = 1:length(x))
  end
  x0 = T[-1 + 2 * rand(T) for _ = 1:n]
  return ADNLPModels.ADNLPModel(f, x0, name = "sphere"; kwargs...)
end
