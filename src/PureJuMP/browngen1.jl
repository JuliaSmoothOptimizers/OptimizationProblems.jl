export browngen1

function browngen1(; n::Int = default_nvar)
  nlp = Model()
  n = max(2, n)
  @variable(nlp, x[1:n])
  for i = 1:n
    set_start_value(x[i], isodd(i) ? 0.0 : -1.0)
  end

  @objective(
    nlp,
    Min,
    sum((x[i - 1] - 3)^2 + (x[i - 1] - x[i])^2 + exp(20 * (x[i - 1] - x[i])) for i = 2:n)
  )
  return nlp
end
