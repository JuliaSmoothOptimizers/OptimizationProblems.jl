export hs201

function hs201(; n::Int=default_nvar, type::Type{T} = Float64, kwargs...) where {T}
    f(x) = 4 * (x[1] - 5)^2 + (x[2] - 6)^2
    x0 = T[8, 9]
    return ADNLPModels.ADNLPModel(f, x0, name="hs201"; kwargs...)
end
