#   Source: problem 18 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.


export BiggsEXP6

function BiggsEXP6(args...; n::Int = default_nvar, kwargs...)
    z = [i/10 for i in 1:13]
    y = [exp(-zi) - 5*exp(-10*zi) + 3*exp(-4*zi) for zi in z]
    nlp = Model()
    @variable(nlp, x[i=1:6], start = 1.0)
    @NLobjective(nlp, Min, sum(x[3]*exp(-x[1]*z[i]) - x[4]*exp(-x[2]*z[i]) + x[6]*exp(-x[5]*z[i]) - y[i] for i in 1:13))
    return nlp
end