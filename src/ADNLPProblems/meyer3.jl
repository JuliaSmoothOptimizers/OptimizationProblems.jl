export meyer3

function meyer3(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  t = 45 .+ 5 * (1:16)
  x0 = T[0.02, 4000, 250]
  y = [
    34780,
    28610,
    23650,
    19630,
    16370,
    13720,
    11540,
    9744,
    8261,
    7030,
    6005,
    5147,
    4427,
    3820,
    3307,
    2872,
  ]
  function f(x)
    return 1 // 2 * sum((x[1] * exp(x[2] / (t[i] + x[3])) - y[i])^2 for i = 1:16)
  end
  return ADNLPModels.ADNLPModel(f, x0, name = "meyer3"; kwargs...)
end
