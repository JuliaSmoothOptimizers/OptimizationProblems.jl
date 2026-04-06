export sphere

function sphere(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return sum(x[i]^2 for i = 1:length(x))
  end
  x0 = zeros(T, n)
  lvar = fill(T(-5.12), n)
  uvar = fill(T(5.12), n)
  return ADNLPModels.ADNLPModel(f, x0; lvar = lvar, uvar = uvar, name = "sphere", kwargs...)
end
