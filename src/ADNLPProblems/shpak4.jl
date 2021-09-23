export Shpak4 
 
function Shpak4(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    n = length(x)
    return (x[1] + sin(x[1])) * exp(-(x[1])^2)
  end
  x0 = -ones(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak4"; kwargs...)
end
