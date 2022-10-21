export brownbs

function brownbs(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return (x[1] - 1000000)^2 + (x[2] - 2 * 1 // 1000000)^2 + (x[1] * x[2] - 2)^2
  end
  x0 = ones(T, 2)
  return ADNLPModels.ADNLPModel(f, x0, name = "brownbs"; kwargs...)
end
