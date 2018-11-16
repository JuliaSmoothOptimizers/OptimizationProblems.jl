#   Another function with nontrivial groups and
#   repetitious elements.

#   Source:
#   N. Gould, private communication.

#   classification OUR2-AY-V-0

#   Problem 51 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export sinquad

"Another function with nontrivial groups and repetitious elements in size 'n' "
function sinquad(n :: Int=100)

    n < 3 && Compat.@warn("sinquad: number of variables must be ≥ 3")
    n = max(3, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=0.1)

    @NLobjective(
      nlp,
      Min,
      (x[1] - 4.0)^4 + (x[n]^2 - x[1]^2)^2 + sum((sin(x[i] - x[n]) - x[1]^2 + x[i]^2)^2 for i=2:n-1)
    )

    return nlp
end
