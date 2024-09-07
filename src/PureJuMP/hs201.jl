# Hock and Schittkowski problem number 201.
#
#   Source:
#   Problem 201 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
export hs201
"HS201 model"
function hs201(args...; n::Int = default_nvar, kwargs...)
  model = Model()

  #Déclaration des variables
  @variable(model, x1)
  set_start_value(x1, 8)
  @variable(model, x2)
  set_start_value(x2, 9)

  #Définition de la fonction objectif
  @objective(model, Min, 4 * (x1 - 5)^2 + (x2 - 6)^2)

  return model
end
