#
# Converted in Julia from https://github.com/mpf/Optimization-Test-Problems
#
# AMPL Model by Hande Y. Benson
#
# Copyright (C) 2001 Princeton University
# All Rights Reserved
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby
# granted, provided that the above copyright notice appear in all
# copies and that the copyright notice and this
# permission notice appear in all supporting documentation.
#   Source: Problem 9 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   See also Buckley#28
#   SIF input: Ph. Toint, Dec 1989.
#   classification NOR2-AN-3-15
export argauss

function argauss(; n::Int = default_nvar, kwargs...)
  nlp = Model()

  xinit = [ 0.4
 1.0
 0.0]
  rhs = [ 0.0009
 0.0044
 0.0175
 0.0540
 0.1295
 0.2420
 0.3521
 0.3989
 0.3521
 0.2420
 0.1295
 0.0540
 0.0175
 0.0044
 0.0009]

  @variable(nlp, -Inf <= x[i=1:3] <= Inf, start = xinit[i])

  @NLobjective(nlp, Min, 
      0
  )
  @NLconstraint(nlp, cons[i=1:15],
 x[1]*exp(-0.5*x[2]*(0.5*(8-i)-x[3])^2) - rhs[i] == 0
  )

  return nlp
end

