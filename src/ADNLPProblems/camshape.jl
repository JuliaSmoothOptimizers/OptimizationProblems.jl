export camshape

function camshape(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    R_min = T(1)
    R_max = T(2)
    R_v = T(1)
    α = T(1.5)
    θ = T(2*pi/(5*(n+1)))
    function f(y)
        return -T(R_v*pi/n) * sum(y[i] for i = 1:n)
    end
    function c(y::V) where {V}
        return vcat(R_max - y[n], y[1] - R_min, [y[i+1] - y[i] for i = 1:(n - 1)], - R_min*y[1] - y[1]*y[2] + 2*R_min*y[2]*cos(θ), - R_min^2 - R_min*y[1] + 2*R_min*y[1]*cos(θ), - y[n-1]*y[n] - y[n]*R_max + 2*y[n-1]*R_max*cos(θ), - 2*R_max*y[n] + 2*y[n]^2*cos(θ), [- y[i-1]*y[i] - y[i]*y[i+1] + 2*y[i-1]*y[i+1]*cos(θ) for i = 2:(n-1)])
    end

    lvar = T(R_min) * ones(T, n)
    uvar = T(R_max) * ones(T, n)
    lcon = vcat(T(-α*θ)*ones(T, n+1), -T(Inf) * ones(T, n+2))
    ucon = vcat(T(α*θ)*ones(T, n+1), zeros(T, n+2))
    x0 = T((R_min + R_max)/2) * ones(T, n)
    return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    c,
    lcon,
    ucon,
    name = "camshape",;
    kwargs...,
    )
end