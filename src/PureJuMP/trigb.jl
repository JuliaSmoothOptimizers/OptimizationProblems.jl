export trigb

function trigb(args...; n::Int = default_nvar, kwargs...)
  model = Model()
  @variable(model, x[i = 1:n], start = 1)

  @objective(
    model,
    Min,
    sum(
      i * ((1 - cos(x[i])) + ((i == 1) ? sin(0) : sin(x[i - 1])) - ((i == n) ? 0 : sin(x[i + 1])))
      for i = 1:n
    )
  )

  return model
end
