export palmer5d

function palmer5d(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  X = [
    0.000000,
    1.570796,
    1.396263,
    1.308997,
    1.221730,
    1.125835,
    1.047198,
    0.872665,
    0.698132,
    0.523599,
    0.349066,
    0.174533,
  ]

  Y = [
    83.57418,
    81.007654,
    18.983286,
    8.051067,
    2.044762,
    0.000000,
    1.170451,
    10.479881,
    25.785001,
    44.126844,
    62.822177,
    77.719674,
  ]
  function f(x)
    Ti = eltype(x)
    return sum((Ti(Y[i]) - sum(x[j] * Ti(X[i])^(2 * j - 2) for j = 1:4))^2 for i = 1:12)
  end
  x0 = ones(T, 4)
  return ADNLPModels.ADNLPModel(f, x0, name = "palmer5d"; kwargs...)
end
