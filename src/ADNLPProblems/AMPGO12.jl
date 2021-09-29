export AMPGO12

function AMPGO12(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sin(x[1])^3 + cos(x[1])^3
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "AMPGO12"; kwargs...)
end
