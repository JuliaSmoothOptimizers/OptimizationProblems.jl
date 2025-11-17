## Banded trigonometric problem (Problem 16)
## F(x) = sum_{i=1}^n i * [ (1 - cos(x_i)) + sin(x_{i-1}) - sin(x_{i+1}) ]
## boundary: x_0 = x_{n+1} = 0

export trigb

function trigb(args...; n::Int = default_nvar, kwargs...)
  model = Model()
  @variable(model, x[i = 1:n], start = 1.0)

  @objective(model, Min,
    sum(
      i * (
        (1 - cos(x[i])) +
        ((i == 1) ? sin(0.0) : sin(x[i - 1])) -
        ((i == n) ? sin(0.0) : sin(x[i + 1]))
      ) for i = 1:n
    )
  )

  return model
end
