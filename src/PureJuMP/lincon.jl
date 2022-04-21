export lincon

function lincon(args...; n::Int = default_nvar, kwargs...)
  A = [1 2; 3 4]
  b = [5; 6]
  B = LinearAlgebra.diagm([3 * i for i = 3:5])
  c = [1; 2; 3]
  C = [0 -2; 4 0]
  d = [1; -1]

  nlp = Model()

  @variable(nlp, x[j = 1:15], start = 0.0)
  @constraint(nlp, 15 * x[15] == 22)
  @constraint(nlp, sum(c[i] * x[9 + i] for i = 1:3) >= 1)
  @constraint(nlp, sum(d[i] * x[12 + i] for i = 1:2) <= 16)
  for j = 1:2
    @constraint(nlp, sum(C[j, i] * x[5 + i] for i = 1:2) == -d[j])
  end
  for j = 1:2
    @constraint(nlp, sum(A[j, i] * x[i] for i = 1:2) >= -b[j])
  end
  for j = 1:3
    @constraint(nlp, sum(B[j, i] * x[2 + i] for i = 1:3) <= c[j])
  end
  @constraint(nlp, -11 <= sum(b[i] * x[7 + i] for i = 1:2) <= 9)
  @NLobjective(nlp, Min, sum(i + x[i]^4 for i = 1:15))

  return nlp
end
