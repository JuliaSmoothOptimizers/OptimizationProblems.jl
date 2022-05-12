export bt1

function bt1(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return 100 * x[1]^2 + 100 * x[2]^2 - x[1] - 100
  end
  x0 = T[0.08, 0.06]
  function c(x)
    return [x[1]^2 + x[2]^2]
  end
  lcon = ones(T, 1)
  ucon = ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "bt1"; kwargs...)
end
