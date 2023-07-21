export hs243

function hs243(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  A = Rational{Int}[0.14272; -0.184918; -0.521869; -0.685306]
  B = Rational{Int}[
    2.95137 4.87407 -2.0506
    4.87407 9.39321 -3.93181
    -2.0506 -3.93189 2.64745
  ]
  D = Rational{Int}[1.75168; -1.35195; -0.479048; -0.3648]
  G = Rational{Int}[
    -0.564255 0.392417 -0.404979
    0.927589 -0.0735083 0.535393
    0.658799 -0.636666 -0.681091
    -0.869487 0.586387 0.289826
  ]
  
  function f(x; A = A, B = B, D = D, G = G)
    F = A + G * x + 1 // 2 * x' * B * x * D
    return  F' * F
  end
  x0 = T[0.1, 0.1, 0.1]

  return ADNLPModels.ADNLPModel(f, x0, name = "hs243"; kwargs...)
end
