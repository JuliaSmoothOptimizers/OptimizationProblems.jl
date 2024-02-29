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
#   J.J. More',"A collection of nonlinear model problems"
#   Proceedings of the AMS-SIAM Summer Seminar on the Computational
#   Solution of Nonlinear Systems of Equations, Colorado, 1988.
#   Argonne National Laboratory MCS-P60-0289, 1989.
#   SIF input: Ph. Toint, Dec 1989.
#   classification NOR2-RN-8-5
export aircrfta

function aircrfta(; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, -Inf <= rollrate <= Inf, start = 0.0)
  @variable(nlp, -Inf <= pitchrat <= Inf, start = 0.0)
  @variable(nlp, -Inf <= yawrate <= Inf, start = 0.0)
  @variable(nlp, -Inf <= attckang <= Inf, start = 0.0)
  @variable(nlp, -Inf <= sslipang <= Inf, start = 0.0)
  @variable(nlp, 0.1 <= elevator <= 0.1, start = 0.0)
  @variable(nlp, 0.0 <= aileron <= 0.0, start = 0.0)
  @variable(nlp, 0.0 <= rudderdf <= 0.0, start = 0.0)

  @objective(nlp, Min, 0)
  @constraint(
    nlp,
    cons1,
    (
      -3.933 * rollrate + 0.107 * pitchrat + 0.126 * yawrate - 9.99 * sslipang - 45.83 * aileron -
      7.64 * rudderdf - 0.727 * pitchrat * yawrate + 8.39 * yawrate * attckang -
      684.4 * attckang * sslipang + 63.5 * pitchrat * attckang
    ) == 0
  )
  @constraint(
    nlp,
    cons2,
    (
      -0.987 * pitchrat - 22.95 * attckang - 28.37 * elevator +
      0.949 * rollrate * yawrate +
      0.173 * rollrate * sslipang
    ) == 0
  )
  @constraint(
    nlp,
    cons3,
    (
      0.002 * rollrate - 0.235 * yawrate + 5.67 * sslipang - 0.921 * aileron - 6.51 * rudderdf -
      0.716 * rollrate * pitchrat - 1.578 * rollrate * attckang + 1.132 * pitchrat * attckang
    ) == 0
  )
  @constraint(nlp, cons4, (pitchrat - attckang - 1.168 * elevator - rollrate * sslipang) == 0)
  @constraint(
    nlp,
    cons5,
    (-yawrate - 0.196 * sslipang - 0.0071 * aileron + rollrate * attckang) == 0
  )

  return nlp
end
