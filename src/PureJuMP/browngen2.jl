export browngen2

function browngen2(; n::Int = default_nvar)
  nlp = Model()
  n = max(2, n)
  @variable(nlp, x[1:n])
  for i = 1:n
    set_start_value(x[i], isodd(i) ? -1.0 : 1.0)
  end

  @objective(nlp, Min, sum((x[i - 1]^2)^(x[i]^2 + 1) + (x[i]^2)^(x[i - 1]^2 + 1) for i = 2:n))
  return nlp
end
