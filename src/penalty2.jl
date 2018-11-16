#   Source:  Problem 24 in
#   J.J. Moré, B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley#112 (p. 80)

#   classification SUR2-AN-V-0
# J.-P. Dussault, Clermont-Ferrand 06/2016.

export penalty2

"A penalty problem by Gill, Murray and Pitfield in size 'n' "
function penalty2(n :: Int=100)

    n < 3 && Compat.@warn("penalty2: number of variables must be ≥ 3")
    n = max(3, n)

    a = 1.0e-5
    m = 2 * n
    y = ones(m)
    for i = 1:m
      y[i] = exp(i / 10.0) + exp((i-1) / 10.0)
    end

    nlp = Model()
    @variable(nlp, x[i=1:n], start=1/2)

    @NLobjective(
      nlp,
      Min,
      (x[1] - 0.2)^2 +
      sum(a * (exp(x[i] / 10.0) + exp(x[i-1] / 10.0) - y[i])^2 for i=2:n) +
      sum(a * (exp(x[i-n+1] / 10.0) - exp(-1/10))^2 for i=n+1:2*n-1) +
      (sum((n-j+1) * x[j]^2  for j=1:n) - 1.0)^2
    )

    return nlp
end
