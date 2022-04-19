#  Source:  Problem 17 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See alos Buckley#32 (p. 77).

#   classification NOR2-MN-5-33
export osborne1

function osborne1(args...; n::Int = default_nvar, kwargs...)

    y = [0.844, 0.908, 0.932, 0.936, 0.925,
     0.908, 0.881, 0.850, 0.818, 0.784,
     0.751, 0.718, 0.685, 0.658, 0.628,
     0.603, 0.580, 0.558, 0.538, 0.522,
     0.506, 0.490, 0.478, 0.467, 0.457,
     0.448, 0.438, 0.431, 0.424, 0.420,
     0.414, 0.411, 0.406]
    m = 33

    nlp = Model()
    x0 = [0.5, 1.5, -1.0, 0.01, 0.02]
    @variable(nlp, x[i=1:5], start=x0[i])
    @NLobjective(
    nlp,
    Min,
    sum((y[j] - (x[1]+ x[2] * exp(-j*x[4]) + x[3]*exp(-j*x[5])))^2 for j = 1:m))
    return nlp
end