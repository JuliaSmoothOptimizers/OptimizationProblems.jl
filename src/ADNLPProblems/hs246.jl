export hs246

function hs246(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    return 100 * (x[3] - ((x[1] + x[2]) / 2)^2)^2 + (1 - x[1])^2 + (1 - x[2])^2
  end
  x0 = T[-1.2; 2; 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "hs246"; kwargs...)
end
