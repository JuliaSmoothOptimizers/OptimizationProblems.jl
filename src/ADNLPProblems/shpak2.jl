export Shpak2

function Shpak2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sin(x[1]) + sin(T(10 / 3) * x[1])
  end
  x0 = T[3.1]
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak2"; kwargs...)
end
