export helical

function helical(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  function f(x)
    return (
             10 * (
               x[3] -
               10 * (atan(x[2] / x[1]) - 1 // 4 * (x[1] - abs(x[1]) / x[1])) / (2 * eltype(x)(pi))
             )
           )^2 +
           (10 * (sqrt(x[1]^2 + x[2]^2) - 1))^2 +
           x[3]^2
  end
  x0 = T[-1; 0; 0]
  return ADNLPModels.ADNLPModel(f, x0, name = "helical"; kwargs...)
end
