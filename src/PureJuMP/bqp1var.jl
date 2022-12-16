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
#   Source: a one variable box-constrained quadratic
#   SIF input: Nick Gould, March 1992
#   classification QBR2-AN-1-0
export bqp1var

function bqp1var(; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, -Inf <= x1 <= Inf, start = 0.25)

  @NLobjective(nlp, Min, x1 + x1^2)
  @NLconstraint(nlp, cons1, 0.0 <= x1 <= 0.5)

  return nlp
end
