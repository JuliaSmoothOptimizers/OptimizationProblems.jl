export beale

function beale(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return (15 // 10 - x[1] * (1 - x[2]))^2 +
           (225 // 100 - x[1] * (1 - x[2]^2))^2 +
           (2625 // 1000 - x[1] * (1 - x[2]^3))^2
  end
  x0 = ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, name = "beale"; kwargs...)
end
