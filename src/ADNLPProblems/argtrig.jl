export argtrig

function argtrig(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x; n = length(x))
    return n - sum(cos(x[j]) + j * (1 - cos(x[j])) - sin(x[j]) for j = 1:n)
  end
  x0 = 1 // n * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "argtrig"; kwargs...)
end
