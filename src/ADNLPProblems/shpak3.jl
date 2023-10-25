export Shpak3

function Shpak3(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  function f(x)
    n = length(x)
    return 1 * sin(2 * x[1] + 1) +
           2 * sin(3 * x[1] + 2) +
           3 * sin(4 * x[1] + 3) +
           4 * sin(5 * x[1] + 4) +
           5 * sin(6 * x[1] + 5)
  end
  x0 = T[-10]
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak3"; kwargs...)
end
