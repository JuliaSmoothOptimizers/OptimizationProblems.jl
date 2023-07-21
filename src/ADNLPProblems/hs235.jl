export hs235

function hs235(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
  end
  x0 = T[-2, 3, 1]
  function c!(cx, x)
    cx[1] = x[1] + x[3]^2 + 1
    return cx
  end
  lcon = ucon = T[0]
  return ADNLPModels.ADNLPModel(f, x0, c!, lcon, ucon, name = "hs235"; kwargs...)
end
