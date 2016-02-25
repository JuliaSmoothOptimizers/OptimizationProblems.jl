#   Source: 
#   Ph. Toint, private communication, 1997.

#   SDIF input: N. Gould and Ph. Toint, November 1997.

#   problem 35 in
#   L. Luksan, C. Matonoha and J. Vlcek  
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#

#   classification SUR2-AN-V-0
# J.-P. Dussault, Rennes 09/2015.


function genhumps(n :: Int = 100)

    nlp = Model()
    
    zeta = 20.0

    x0 = -506.2 * ones(n) 
    x0[1] = -506.0 

    @defVar(nlp,  x[i=1:n], start = x0[i])


    @setNLObjective(
                    nlp,
                    Min,
	            sum {( sin (zeta*x[i])^2 * sin(zeta*x[i+1])^2 + 0.05*(x[i]^2+x[i+1]^2) ), i=1:n-1}
                    )

    return nlp
end

