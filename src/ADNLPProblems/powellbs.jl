export powellbs

function powellbs(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    f(x) = one(T)/2 * ((T(10^4)*x[1]*x[2]-1)^2+(exp(-x[1])+exp(-x[2])-T(1.0001))^2)
    x0 = T[0, 1]
    return ADNLPModels.ADNLPModel(f, x0, name = "powellbs"; kwargs...)
end
