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
#   Source: Problem 36 in
#   A.R. Buckley,
#   "Test functions for unconstrained minimization",
#   TR 1989CS-3, Mathematics, statistics and computing centre,
#   Dalhousie University, Halifax (CDN), 1989.
#   SIF input: Ph. Toint, Dec 1989.
#   classification NLR2-AN-2-2
export booth

function booth(; n::Int = default_nvar, kwargs...)
  nlp = Model()


  @variable(nlp, -Inf <= x[1:2] <= Inf, start = 0.0)

  @NLobjective(nlp, Min, 
      0
  )
  @NLconstraint(nlp, cons1,
(x[1]+2*x[2]-7) == 0
  )
  @NLconstraint(nlp, cons2,
(2*x[1]+x[2]-5) == 0
  )

  return nlp
end

