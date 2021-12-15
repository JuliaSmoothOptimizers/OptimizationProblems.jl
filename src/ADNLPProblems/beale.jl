export beale

function beale(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (T(1.5) - x[1] * (1 - x[2]))^2 +
           (T(2.25) - x[1] * (1 - x[2]^2))^2 +
           (T(2.625) - x[1] * (1 - x[2]^3))^2
  end
  x0 = ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, name = "beale"; kwargs...)
end
