export jennrichsampson

function jennrichsampson(; n::Int = default_nvar, type::Val{T} = Val(Float64), m::Int=10, kwargs...) where {T}

    x0 = T[0.3;0.4]
    f(x) = sum((2 + 2*i - (exp(i*x[1]) + exp(i*x[2])))^2 for i in 1:m)

    return ADNLPModels.ADNLPModel(f, x0, name = "jennrichsampson"; kwargs...)
end
