export AMPGO18

function AMPGO18(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    # return x[1] <= 3 ? (x[1] - 2)^2 : log(x[1] - 2) + log(x[1] - 2) + 1
    return (x[1] <= 3) * (x[1] - 2)^2 + (x[1] > 3) * (2 * log(abs(x[1] - 2)) + 1)
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO18"; kwargs...)
end
