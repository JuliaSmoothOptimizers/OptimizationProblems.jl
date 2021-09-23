export hs102 
 
function hs102(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  a = 0.125
  exposant_f = Array{T}(undef, 4, 7)
  exposant_f[1, :] = [1, -1, 0, 2, 0, -3, a]
  exposant_f[2, :] = [-1, -2, 1, 1, -1, 0, -0.5]
  exposant_f[3, :] = [-2, 1, 0, -1, -2, 1, 0]
  exposant_f[4, :] = [2, 2, -1, 0, 0.5, -2, 1]
  exposant_c1 = Array{T}(undef, 3, 7)
  exposant_c1[1, :] = [0.5, 0, -1, 0, 0, -2, 1]
  exposant_c1[2, :] = [3, 1, -2, 0, 0, 1, 0.5]
  exposant_c1[3, :] = [0, -1, 1, -0.5, 0, 2 / 3, 1 / 4]
  exposant_c2 = Array{T}(undef, 3, 7)
  exposant_c2[1, :] = [-0.5, 1, -1, 0, -1, 1, 0]
  exposant_c2[2, :] = [0, 0, 1, -1, -1, 2, 0]
  exposant_c2[3, :] = [-1, 0.5, 0, -2, -1, 1 / 3, 0]
  exposant_c3 = Array{T}(undef, 4, 7)
  exposant_c3[1, :] = [1, 0, -1.5, 0, 1, -1, 1 / 3]
  exposant_c3[2, :] = [0, 1, -0.5, 0, 1, -1, -0.5]
  exposant_c3[3, :] = [-1, 1, 0.5, 0, 1, 0, 0]
  exposant_c3[4, :] = [0, -2, 1, 0, 1, -1, 1]
  exposant_c4 = Array{T}(undef, 4, 7)
  exposant_c4[1, :] = [-2, 1, 0, -1, 0.5, 0, 1 / 3]
  exposant_c4[1, :] = [0.5, 2, 1, 1 / 3, -2 / 3, 0, 1 / 4]
  exposant_c4[1, :] = [-3, -2, 1, 0, 1, 0, 3 / 4]
  exposant_c4[1, :] = [0, 0, -2, 1, 0, 0, 0.5]
  function f(x)
    n = length(x)
    return 10 * prod(x[i]^exposant_f[1, i] for i = 1:7) +
    15 * prod(x[i]^exposant_f[2, i] for i = 1:7) +
    20 * prod(x[i]^exposant_f[3, i] for i = 1:7) +
    25 * prod(x[i]^exposant_f[4, i] for i = 1:7)
  end
  x0 = 6 * ones(T, 7)
  lvar = T[0.1 * ones(6); 0.01]
  uvar = 10 * ones(T, 7)
  function c(x)
    n = length(x)
    f = 10 * prod(x[i]^exposant_f[1, i] for i = 1:7) +
    15 * prod(x[i]^exposant_f[2, i] for i = 1:7) +
    20 * prod(x[i]^exposant_f[3, i] for i = 1:7) +
    25 * prod(x[i]^exposant_f[4, i] for i = 1:7)
    return [
      1 - 0.5 * prod(x[i]^exposant_c1[1, i] for i = 1:7) -
      0.7 * prod(x[i]^exposant_c1[2, i] for i = 1:7) -
      0.2 * prod(x[i]^exposant_c1[3, i] for i = 1:7),
      1 - 1.3 * prod(x[i]^exposant_c2[1, i] for i = 1:7) -
      0.8 * prod(x[i]^exposant_c2[2, i] for i = 1:7) -
      3.1 * prod(x[i]^exposant_c2[3, i] for i = 1:7),
      1 - 2 * prod(x[i]^exposant_c3[1, i] for i = 1:7) -
      0.1 * prod(x[i]^exposant_c3[2, i] for i = 1:7) - 1 * prod(x[i]^exposant_c3[3, i] for i = 1:7) -
      0.65 * prod(x[i]^exposant_c3[4, i] for i = 1:7),
      1 - 0.2 * prod(x[i]^exposant_c4[1, i] for i = 1:7) -
      0.3 * prod(x[i]^exposant_c4[2, i] for i = 1:7) -
      0.4 * prod(x[i]^exposant_c4[3, i] for i = 1:7) -
      0.5 * prod(x[i]^exposant_c4[4, i] for i = 1:7),
      f
    ]
  end
  lcon = vcat(zeros(T, 4), 100)
  ucon = vcat(T(Inf) * ones(T, 4), 3000)
  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "hs102"; kwargs...)
end
