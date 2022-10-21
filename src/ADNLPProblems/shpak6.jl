export Shpak6

function Shpak6(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  veca =
    [4696 // 1000 4885 // 1000 800 // 1000 4986 // 1000 3901 // 1000 2395 // 1000 945 // 1000 8371 //
                                                                                              1000 6181 //
                                                                                                   1000 5713 //
                                                                                                        1000]
  veck =
    [2871 // 1000 2328 // 1000 1111 // 1000 1263 // 1000 2399 // 1000 2629 // 1000 2853 // 1000 2344 //
                                                                                                1000 2592 //
                                                                                                     1000 2929 //
                                                                                                          1000]
  vecc =
    [149 // 1000 166 // 1000 175 // 1000 183 // 1000 128 // 1000 117 // 1000 115 // 1000 148 // 1000 188 //
                                                                                                     1000 198 //
                                                                                                          1000]
  function f(x)
    n = length(x)
    return -sum(1 / (veck[i]^2 * (x[1] - veca[i])^2 + vecc[i]) for i = 1:10)
  end
  x0 = zeros(T, 1)
  return ADNLPModels.ADNLPModel(f, x0, name = "Shpak6"; kwargs...)
end
