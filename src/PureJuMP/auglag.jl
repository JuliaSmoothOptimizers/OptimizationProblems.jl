export auglag

function auglag(; n::Int = default_nvar)
  λ₁ = -0.002008
  λ₂ = -0.001900
  λ₃ = -0.000261
  
  nlp = Model()
  @variable(nlp, x[1:n])

  for i = 1:n
    m = mod(i, 5)
    if m == 1
      set_start_value(x[i], i <= 2 ? -2.0 : -1.0)
    elseif m == 2
      set_start_value(x[i], i <= 2 ? 2.0 : -1.0)
    elseif m == 3
      set_start_value(x[i], 2.0)
    elseif m == 4
      set_start_value(x[i], -1.0)
    else
      set_start_value(x[i], -1.0)
    end
  end

  @NLexpression(nlp, obj_sum,
    sum(
      exp(prod(x[i+1-j] for j = 1:5 if 1 <= i+1-j <= n)) +
      10 * (sum(x[i+1-j]^2 for j = 1:5 if 1 <= i+1-j <= n) - 10 - λ₁)^2 +
      (i >= 4 ? (x[i-3]*x[i-2] - 5*x[i-1]*x[i] - λ₂)^2 : 0) +
      (i >= 4 ? (x[i-4]^3 + x[i-3]^3 + 1 - λ₃)^2 : 0)
      for i = 1:n if mod(i, 5) == 0
    )
  )
  
  @NLobjective(nlp, Min, obj_sum)
  return nlp
end
