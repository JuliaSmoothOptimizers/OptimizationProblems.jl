#   A sparse problem involving sine functions

#   classification OUR2-AN-V-0

#   Problem 52 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export sparsine

"A sparse problem involving sine functions in size 'n' "
function sparsine(n :: Int=100)

    n < 10 && Compat.@warn("sparsine: number of variables must be ≥ 10")
    n = max(10, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=0.5)

    @NLobjective(
      nlp,
      Min,
      0.5 * sum(
        i * (sin(x[i]) +
        sin(x[mod(2*i-1, n) + 1]) +
        sin(x[mod(3*i-1, n) + 1]) +
        sin(x[mod(5*i-1, n) + 1]) +
        sin(x[mod(7*i-1, n) + 1]) +
        sin(x[mod(11*i-1, n) + 1]))^2 for i=1:n)
    )

    return nlp
end
