export brownden

function brownden(; m::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  m < 4 && @warn("brownden: must have m ≥ 4")
  m = max(m, 4)
  x0 = T[25.0; 5.0; -5.0; -1.0]
  t = [i // 5 for i = 1:m]
  function f(x)
    Ti = eltype(x)
    return sum(
      ((x[1] + t[i] * x[2] - exp(Ti(t[i])))^2 + (x[3] + x[4] * sin(Ti(t[i])) - cos(Ti(t[i])))^2)^2
      for i = 1:m
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "brownden"; kwargs...)
end
