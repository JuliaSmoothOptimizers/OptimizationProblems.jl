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
#   N. Gould, private communication.
#   SIF input: Nick Gould, June 1990.
#   classification OUR2-AY-4-0
export allinitu

function allinitu(; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, -Inf <= x[1:4] <= Inf, start = 0.0)

  @objective(
    nlp,
    Min,
    x[3] - 1 + x[1]^2 + x[2]^2 + (x[3] + x[4])^2 + sin(x[3])^2 + x[1]^2 * x[2]^2 + x[4] - 3 +
    sin(x[3])^2 +
    (x[4] - 1)^2 +
    (x[2]^2)^2 +
    (x[3]^2 + (x[4] + x[1])^2)^2 +
    (x[1] - 4 + sin(x[4])^2 + x[2]^2 * x[3]^2)^2 +
    sin(x[4])^4
  )

  return nlp
end
