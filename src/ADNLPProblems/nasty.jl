export nasty

function nasty(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 // 2 * ((T(1.0e10) * x[1])^2 + x[2]^2)
  end
  x0 = T[1.0e-30, 1.0]
  return ADNLPModels.ADNLPModel(f, x0, name = "nasty"; kwargs...)
end
