export errinros_mod

function errinros_mod(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("errinros : n ≥ 2")
  function f(x)
    n = length(x)
    return sum((x[i - 1] - 16 * x[i]^2 * T(1.5 + sin(i))^2)^2 for i = 2:n) +
           sum((1 - x[i])^2 for i = 2:n)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "errinros_autodiff"; kwargs...)
end
