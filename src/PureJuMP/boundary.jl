export boundary

function boundary(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  h = one(T) / T(n + 1)
  model = Model()
  # set a type-stable start vector matching ADNLPProblems.boundary x0
  x0 = [T(i) * h * (one(T) - T(i) * h) for i = 1:n]
  @variable(model, x[i = 1:n], start = x0[i])
  @objective(model, Min,
    sum((T(2) * x[i] - (i == 1 ? zero(x[1]) : x[i-1]) - (i == n ? zero(x[1]) : x[i+1])
      + (h^2 / T(2)) * (x[i] + T(i) * h + one(T))^3)^2 for i = 1:n))
  return model
end
