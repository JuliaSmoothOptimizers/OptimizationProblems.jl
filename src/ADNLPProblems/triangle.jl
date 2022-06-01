export triangle

function triangle(τ::Float64 = 0.0, x0 = xe, TRIS::Vector{Int64} = Triangles, Const::Vector{Int64} = Constantes; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    n =length(x0)
    N = Int(div(n,2))
    E = Int(div(length(TRIS),3))
    
    function area(e,x)
        return 2*((x[TRIS[e+E]]-x[TRIS[e]])*(x[TRIS[e+2*E]+N]-x[TRIS[e]+N])-(x[TRIS[e+2*E]]-x[TRIS[e]])*(x[TRIS[e+E]+N]-x[TRIS[e]+N])) / sqrt(3)
    end
    function nfrob(e,x)
        nfrobe = 0
        for i = 0:1
            nfrobe = nfrobe + (1*x[TRIS[e+E]+N*i]-x[TRIS[e]+N*i])^2 + (2*x[TRIS[e+2*E]+N*i]-x[TRIS[e+E]+N*i]-x[TRIS[e]+N*i])^2 / 3
        end
        return nfrobe
    end
    
    
    function f(y)
        return sum(nfrob(e,y)/(2*area(e,y)) for e=1:E)
    end
    function c(y::V) where {V}
        ci = [area(e,y) for e=1:E]
        return ci
    end

    lvar = -T(Inf) * ones(T, n)
    lvar[Const] = x0[Const]
    lvar[Const.+N] = x0[Const.+N]
    
    uvar = T(Inf) * ones(T, n)
    uvar[Const] = x0[Const]
    uvar[Const.+N] = x0[Const.+N]
    
    lcon = τ*ones(T, E)
    ucon = T(Inf)*ones(T, E)
    return ADNLPModels.ADNLPModel(
    f,
    x0,
    lvar,
    uvar,
    c,
    lcon,
    ucon,
    name = "triangle",;
    kwargs...,
    )
end

export triangle_deer
triangle_deer(;kwargs...) = triangle(x0 = xe_deer, TRIS=TRIS_deer, Const=Const_deer; kwargs...)

export triangle_pac
triangle_pac(;kwargs...) = triangle(x0 = xe_pac, TRIS=TRIS_pac, Const=Const_pac; kwargs...)

export triangle_turtle
triangle_turtle(; kwargs...) = triangle_turtle(x0 = xe_turtle, TRIS=TRIS_turtle, Const=Const_turtle; kwargs...)
