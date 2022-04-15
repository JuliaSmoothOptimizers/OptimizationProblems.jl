export osborn1


function osborn1(args...; type::Val = Val(Float64), kwargs...)

    y = [0.844, 0.908, 0.932, 0.936, 0.925,
     0.908, 0.881, 0.850, 0.818, 0.784,
     0.751, 0.718, 0.685, 0.658, 0.628,
     0.603, 0.580, 0.558, 0.538, 0.522,
     0.506, 0.490, 0.478, 0.467, 0.457,
     0.448, 0.438, 0.431, 0.424, 0.420,
     0.414, 0.411, 0.406]
    nlp = Model()
    @variable(nlp, x[1:5])
    @NLobjective(
    nlp,
    Min,
    sum(y[t] - (x[1]+ x[2] * exp(-t*x[4]) + x[3]*exp(-t*x[5])) for t = 1:m))
    return nlp
end