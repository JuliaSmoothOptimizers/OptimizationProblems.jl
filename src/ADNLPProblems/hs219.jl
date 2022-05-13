function hs219(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
    function f(x)
      return -x[1]
    end
    function c(x)
      return [
          x[1]^2 - x[2] - x[4]^2,
          x[2] - x[1]^3 - x[3]^2
      ]
    end
    x0 = 10 * ones(T, 4)
    lcon = zeros(T, 2)
    ucon = zeros(T, 2)
    nlp = ADNLPModels.ADNLPModel(f, x0, c, lcon, ucon, name = "hs219", lin = [1]; kwargs...)
    return nlp
  end