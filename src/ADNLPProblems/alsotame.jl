export alsotame

function alsotame(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}


  function f(x)
    x, y = x[1], x[2]
    return     exp(x-2*y)
  end
  x0 = T[
    0.0,
    0.0,
  ]
  lvar = T[
    -Inf,
    -Inf,
  ]
  uvar = T[
    Inf,
    Inf,
  ]

  function c(x)
    x, y = x[1], x[2]
    return vcat(
      sin(-x+y-1),
      x,
      y,
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, T[0, -2, -1.5], T[0, 2, 1.5], name = "alsotame", minimize = true; kwargs...)
end

