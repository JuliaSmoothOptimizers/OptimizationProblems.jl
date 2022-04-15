export BOX2

function BOX2(args...; n::Int = default_nvar, type::Val{T} = Val(Float64), m::Int = 10, kwargs...) where {T}
  m < 3 && @warn("BOX2: must have m ≥ 3")
  m = max(m, 3)

  x0 = T[0; 10; 1]
  f(x) = one(T)/2*sum((exp(-one(T)/10*j*x[1]) - exp(-one(T)/10*j*x[2]) -x[3]*(exp(-one(T)/10*j) - exp(-T(j))))^2 for j = 1:m)
  c(x) = [x[3]]
  l = ones(T, 1)
  
  return ADNLPModels.ADNLPModel(f, x0, c, l, l, name = "BOX2", lin = [1]; kwargs...)
end
