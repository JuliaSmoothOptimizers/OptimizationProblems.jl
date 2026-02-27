export srosenbr

function srosenbr(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  n_orig = n
  n = 2 * max(1, div(n, 2))
  @adjust_nvar_warn("srosenbr", n_orig, n)
  function f(x; n = length(x))
    return sum(100 * (x[2 * i] - x[2 * i - 1]^2)^2 + (x[2 * i - 1] - 1)^2 for i = 1:div(n, 2))
  end

  x0 = ones(T, n)
  x0[2 * (collect(1:div(n, 2))) .- 1] .= -1.2

  return ADNLPModels.ADNLPModel(f, x0, name = "srosenbr"; kwargs...)
end
