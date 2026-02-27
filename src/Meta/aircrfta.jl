aircrfta_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "aircrfta",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :notes => raw"""
Converted in Julia from https://github.com/mpf/Optimization-Test-Problems

AMPL Model by Hande Y. Benson

Copyright (C) 2001 Princeton University
All Rights Reserved

Permission to use, copy, modify, and distribute this software and
its documentation for any purpose and without fee is hereby
granted, provided that the above copyright notice appear in all
copies and that the copyright notice and this
permission notice appear in all supporting documentation.
""",
  :origin_notes => raw"""
SIF input: Ph. Toint, Dec 1989. classification NOR2-RN-8-5
""",
  :reference => raw"""
Problem 9,
J.J. More, A collection of nonlinear model problems,
Proceedings of the AMS-SIAM Summer Seminar on the Computational.
Solution of Nonlinear Systems of Equations, Colorado, 1988.
Argonne National Laboratory MCS-P60-0289, 1989.
""",
)
get_aircrfta_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_aircrfta_ncon(; n::Integer = default_nvar, kwargs...) = 5
get_aircrfta_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_aircrfta_nnln(; n::Integer = default_nvar, kwargs...) = 5
get_aircrfta_nequ(; n::Integer = default_nvar, kwargs...) = 5
get_aircrfta_nineq(; n::Integer = default_nvar, kwargs...) = 0
