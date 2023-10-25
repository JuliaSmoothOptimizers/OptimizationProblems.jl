export Shpak5

function Shpak5(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  veca =
    [3040 // 1000 1098 // 1000 674 // 1000 3537 // 1000 6173 // 1000 8679 // 1000 4503 // 1000 3328 //
                                                                                               1000 6937 //
                                                                                                    1000 700 //
                                                                                                         1000]
  veck =
    [2983 // 1000 2378 // 1000 2439 // 1000 1168 // 1000 2406 // 1000 1236 // 1000 2868 // 1000 1378 //
                                                                                                1000 2348 //
                                                                                                     1000 2268 //
                                                                                                          1000]
  vecc =
    [192 // 1000 140 // 1000 127 // 1000 132 // 1000 125 // 1000 189 // 1000 187 // 1000 171 // 1000 188 //
                                                                                                     1000 176 //
                                                                                                          1000]
  function f(x)
    n = length(x)
    return -sum(1 / (veck[i]^2 * (x[1] - veca[i])^2 + vecc[i]) for i = 1:10)
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak5"; kwargs...)
end
