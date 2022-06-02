include("OptimizationProblems.jl/data/triangle.jl")
export triangle

function triangle(x0 = xe, TRIS::Vector{Int64} = Tr, Const::Vector{Int64} = Constants; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  τ = zero(T)
  n =length(x0)
  N = Int(div(n,2))
  E = Int(div(length(TRIS),3))
  
  function area(e,x)
    return 2*((x[TRIS[e+E]]-x[TRIS[e]])*(x[TRIS[e+2*E]+N]-x[TRIS[e]+N])-(x[TRIS[e+2*E]]-x[TRIS[e]])*(x[TRIS[e+E]+N]-x[TRIS[e]+N])) / T(sqrt(3))
  end
  function nfrob(e,x)
    return sum((1*x[TRIS[e+E]+N*i]-x[TRIS[e]+N*i])^2 + (2*x[TRIS[e+2*E]+N*i]-x[TRIS[e+E]+N*i]-x[TRIS[e]+N*i])^2 / 3 for i =0:1)
  end
  
  
  function f(y)
    return sum(nfrob(e,y)/(2*area(e,y)) for e=1:E)
  end
  function c(y)
    return [area(e,y) for e=1:E]
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
  name = "triangle";
  kwargs...,
  )
end


include("OptimizationProblems.jl/data/triangle_deer.jl")
export triangle_deer
triangle_deer(;kwargs...) = triangle(x0 = xe_deer, TRIS=TRIS_deer, Const=Const_deer; kwargs...)

include("OptimizationProblems.jl/data/triangle_pacman.jl")
export triangle_pacman
triangle_pacman(;kwargs...) = triangle(x0 = xe_pacman, TRIS=TRIS_pacman, Const=Const_pacman; kwargs...)

include("OptimizationProblems.jl/data/triangle_turtle.jl")
export triangle_turtle
triangle_turtle(; kwargs...) = triangle_turtle(x0 = xe_turtle, TRIS=TRIS_turtle, Const=Const_turtle; kwargs...)