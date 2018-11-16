#   A sparse quartic problem

#   classification OUR2-AN-V-0

#   Problem 53 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export sparsqur

"A sparse quartic problem in size 'n' "
function sparsqur(n :: Int=100)

    n < 10 && Compat.@warn("sparsqur: number of variables must be ≥ 10")
    n = max(10, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=0.5)

    @NLobjective(
      nlp,
      Min,
      1/8 * sum(
        i * (x[i]^2 +
        x[mod(2*i-1, n) + 1]^2 +
        x[mod(3*i-1, n) + 1]^2 +
        x[mod(5*i-1, n) + 1]^2 +
        x[mod(7*i-1, n) + 1]^2 +
        x[mod(11*i-1, n) + 1]^2)^2 for i=1:n)
    )

    return nlp
end
