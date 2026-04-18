export curly, curly10, curly20, curly30

"Curly function in size `n` with semi-bandwidth `b`"
function curly(args...; n::Int = default_nvar, b::Int = 10, kwargs...)
  n < 2 && @warn("curly: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  x0 = [1.0e-4 * i / (n + 1) for i = 1:n]

  @variable(nlp, x[i = 1:n], start = x0[i])

  @expression(nlp, f[i = 1:n], sum(x[j] for j = i:min(i + b, n)))

  @objective(nlp, Min, sum(f[i] * (f[i] * (f[i]^2 - 20) - 0.1) for i = 1:n))

  return nlp
end

"Curly function in size `n` with semi-bandwidth 10"
curly10(args...; n::Int = default_nvar, kwargs...) = curly(n = n, b = 10)

"Curly function in size `n` with semi-bandwidth 20"
curly20(args...; n::Int = default_nvar, kwargs...) = curly(n = n, b = 20)

"Curly function in size `n` with semi-bandwidth 30"
curly30(args...; n::Int = default_nvar, kwargs...) = curly(n = n, b = 30)
