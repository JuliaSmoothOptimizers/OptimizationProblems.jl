export BiggsEXP6

function BiggsEXP6(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    z = [T(i)/10 for i in 1:13]
    y = [exp(-zi) - 5*exp(-10*zi) + 3*exp(-4*zi) for zi in z]
    f(x) = sum(x[3]*exp(-x[1]*z[i]) - x[4]*exp(-x[2]*z[i]) + x[6]*exp(-x[5]*z[i]) - y[i] for i in 1:13)
    x0 = ones(T, 6)
    return ADNLPModels.ADNLPModel(f, x0, name = "BiggsEXP6"; kwargs...)
end