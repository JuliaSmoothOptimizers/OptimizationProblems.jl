export Dus2_9

function Dus2_9(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 - 12 * x[1] + 15 // 2 * x[1]^2 - x[1]^3
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "Dus2_9"; kwargs...)
end
