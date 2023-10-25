export cliff

function cliff(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return (1 // 100 * x[1] - 3 // 100)^2 - x[1] + x[2] + exp(20 * (x[1] - x[2]))
  end
  x0 = T[0, -1]
  return ADNLPModels.ADNLPModel(f, x0, name = "cliff"; kwargs...)
end
