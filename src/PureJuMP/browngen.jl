export browngen

function browngen(; n::Int = default_nvar)
  nlp = Model()
  @variable(nlp, x[1:n])
  for i in 1:n
    set_start_value(x[i], isodd(i) ? 0.0 : -1.0)
  end
  @NLobjective(nlp, Min, sum((x[i-1] - 3)^2 + (x[i-1] - x[i])^2 + exp(20 * (x[i-1] - x[i])) for i = 2:n))
  return nlp
end
