# Minimize the sum of the inverse weighted mean ratio of the elements in a fixed–boundary
# triangular mesh by adjusting the locations of the free vertices.

#  This is problem 18 in the COPS (Version 3) collection of 
#   E. Dolan and J. More
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)


include("../../data/triangle.jl")
export triangle

function triangle(x0 = xe, TRIS::Vector{Int64} = Tr, Const::Vector{Int64} = Constants; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  x0 = T.(x0)
  τ = zero(T)
  n = length(x0)
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


include("../../data/triangle_deer.jl")
export triangle_deer
triangle_deer(;kwargs...) = triangle(xe_deer, TRIS_deer, Const_deer; name = "triangle_deer", kwargs...)

include("../../data/triangle_pacman.jl")
export triangle_pacman
triangle_pacman(;kwargs...) = triangle(xe_pacman, TRIS_pacman, Const_pacman; name = "triangle_pacman", kwargs...)

include("../../data/triangle_turtle.jl")
export triangle_turtle
triangle_turtle(; kwargs...) = triangle(xe_turtle, TRIS_turtle, Const_turtle; name = "triangle_turtle", kwargs...)