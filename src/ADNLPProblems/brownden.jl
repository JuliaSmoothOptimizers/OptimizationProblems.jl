export brownden

function brownden(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  n < 4 && @warn("brownden: must have n ≥ 4")
  n = max(n, 4)
  x0 = T[25.0; 5.0; -5.0; -1.0]
  t = T[i / 5 for i = 1:n]
  function f(x)
    return sum(
      ((x[1] + t[i] * x[2] - exp(t[i]))^2 + (x[3] + x[4] * sin(t[i]) - cos(t[i]))^2)^2 for i = 1:n
    )
  end

  return ADNLPModels.ADNLPModel(f, x0, name = "brownden_autodiff"; kwargs...)
end
