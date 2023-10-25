export AMPGO07

function AMPGO07(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (x[1] <= 0) * convert(eltype(x), Inf) +
           sin(x[1]) +
           sin(10 // 3 * x[1]) +
           log(abs(x[1])) - 84 // 100 * x[1] + 3
  end
  x0 = T(2.7) * ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO07"; kwargs...)
end
