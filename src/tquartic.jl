#   A quartic function with nontrivial groups and
#   repetitious elements.

#   Source:
#   Ph. Toint, private communication.

#   classification SUR2-AN-V-0#

#   Problem 57 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
# J.-P. Dussault, Clermont-Ferrand 05/2016.

export tquartic

"A quartic function with nontrivial groups and repetitious elements in size 'n' "
function tquartic(n :: Int=100)

    n < 2 && @warn("tquartic: number of variables must be ≥ 2")
    n = max(2, n)

    nlp = Model()

    @variable(nlp, x[i=1:n], start=0.1)

    @NLobjective(
      nlp,
      Min,
      (x[1] - 1.0)^2 + sum((x[1]^2 - x[i+1]^2)^2 for i=1:n-2)
    )

    return nlp
end
