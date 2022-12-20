export genhumps

function genhumps(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x; n = length(x))
    ζ = 20
    return sum(
      (sin(ζ * x[i])^2 * sin(ζ * x[i + 1])^2 + (5 // 100) * (x[i]^2 + x[i + 1]^2)) for i = 1:(n - 1)
    )
  end

  x0 = -T(506.2) * ones(T, n)
  x0[1] = -506
  return ADNLPModels.ADNLPModel(f, x0, name = "genhumps"; kwargs...)
end
