
export osborne1

function osborne1(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    y = T[0.844, 0.908, 0.932, 0.936, 0.925,
       0.908, 0.881, 0.850, 0.818, 0.784,
       0.751, 0.718, 0.685, 0.658, 0.628,
       0.603, 0.580, 0.558, 0.538, 0.522,
       0.506, 0.490, 0.478, 0.467, 0.457,
       0.448, 0.438, 0.431, 0.424, 0.420,
       0.414, 0.411, 0.406]

    function f(x)
      m = 33
      return  sum((y[j] - (x[1]+ x[2] * exp(-j*x[4]) + x[3]*exp(-j*x[5])) for j = 1:m))
    end
    x0 = T[0.5; 1.5; -1; 0.01; 0.02]
    return ADNLPModels.ADNLPModel(f, x0, name = "osborne1"; kwargs...)
  end