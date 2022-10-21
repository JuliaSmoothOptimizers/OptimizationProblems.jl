export chnrosnb_mod

function chnrosnb_mod(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 2 && @warn("chnrosnb: number of variables must be ≥ 2")
  n = max(2, n)
  function f(x)
    n = length(x)
    return 16 * sum((x[i - 1] - x[i]^2)^2 * (15 // 10 + sin(T(i)))^2 for i = 2:n) +
           sum((1 - x[i])^2 for i = 2:n)
  end
  x0 = -ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "chnrosnb"; kwargs...)
end
