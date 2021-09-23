export Shpak1 
 
function Shpak1(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return sin(x[1]) + sin(T(10 / 3) * x[1])
  end
  x0 = T[2.7]
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak1"; kwargs...)
end
