export AMPGO03

function AMPGO03(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return -(
      1 * sin(2 * x[1] + 1) +
      2 * sin(3 * x[1] + 2) +
      3 * sin(4 * x[1] + 3) +
      4 * sin(5 * x[1] + 4) +
      5 * sin(6 * x[1] + 5) +
      6 * sin(7 * x[1] + 6)
    )
  end
  x0 = T[-10.0]
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO03"; kwargs...)
end
