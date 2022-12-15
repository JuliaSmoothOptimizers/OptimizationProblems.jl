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
#   Source:
#   A.R. Conn, N. Gould and Ph.L. Toint,
#   "The LANCELOT User's Manual",
#   Dept of Maths, FUNDP, 1991.
#   SIF input:  Ph. Toint, Jan 1991.
#   classification OOR2-AN-2-1
export alsotame

function alsotame(; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, -Inf <= x <= Inf, start = 0.0)
  @variable(nlp, -Inf <= y <= Inf, start = 0.0)

  @NLobjective(nlp, Min, exp(x - 2 * y))
  @NLconstraint(nlp, cons1, sin(-x + y - 1) == 0)
  @NLconstraint(nlp, cons2, -2 <= x <= 2)
  @NLconstraint(nlp, cons3, -1.5 <= y <= 1.5)

  return nlp
end
