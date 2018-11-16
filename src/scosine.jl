#   Another function with nontrivial groups and
#   repetitious elements.
#   NB: scaled version of COSINE

#   Source:
#   N. Gould, private communication.

#   classification OUR2-AN-V-0

#   Problem 50 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export scosine

"Another function with nontrivial groups and repetitious elements in size 'n' "
function scosine(n :: Int=100)

    n < 2 && Compat.@warn("scosine: number of variables must be ≥ 2")
    n = max(2, n)

    nlp = Model()
    p = zeros(n)
    for i=1:n
      p[i] = exp(6.0 * (i-1) / (n-1))
    end

    @variable(nlp, x[i=1:n], start=1.0/p[i])

    @NLobjective(
      nlp,
      Min,
      sum(cos(p[i]^2 * x[i]^2 - p[i+1] * x[i+1] / 2.0) for i=1:n-1)
    )

    return nlp
end
