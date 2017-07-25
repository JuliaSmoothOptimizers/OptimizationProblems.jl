# first problem of
#Global optimization in one-dimensional case
#using analytically defined derivatives of
#objective function

#A.Shpak

#Computer Science Journal of Moldova, vol.3, no.2(8), 1995

export Shpak1

function Shpak1(n::Int64=1)
   nlp = Model()

   @variable(nlp, x, start=2.7)

   @NLobjective(
    nlp,
    Min,
    sin(x)+sin(10/3*x)
   )

   return nlp
end
