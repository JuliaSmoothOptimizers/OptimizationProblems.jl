export liarwhd

function liarwhd(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n ≥ 2 || error("liarwhd : n ≥ 2")
  function f(x)
    n = length(x)
    return sum(4 * (x[i]^2 - x[1])^2 + (x[i] - 1)^2 for i = 1:n)
  end
  x0 = 4 * ones(T, n)
  return ADNLPModels.ADNLPModel(f, x0, name = "liarwhd_autodiff"; kwargs...)
end
