aircrfta2_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "aircrfta2",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :constant,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://www.osti.gov/biblio/6449249, https://github.com/ralna/SIF/blob/master/AIRCRFTA2.SIF",
  :notes => raw"""
The aircraft stability problem by Rheinboldt, as a function
of the elevator, aileron and rudder deflection controls.

This is CUTEst's AIRCRFTA2. In the fourth equation the coefficient of
the elevator is -0.168, and the bilinear term with coefficients 63.5
(first equation) and 1.132 (third equation) is the product of the
aileron and the angle of attack. aircrfta is the same problem with
-1.168 and the product of the pitch rate and the angle of attack, as in
CUTEst's AIRCRFTA.

classification NOR2-RN-8-5
""",
  :origin_notes => raw"""
Problem 9 in
J.J. More',"A collection of nonlinear model problems"
Proceedings of the AMS-SIAM Summer Seminar on the Computational
Solution of Nonlinear Systems of Equations, Colorado, 1988.
Argonne National Laboratory MCS-P60-0289, 1989.

SIF input: Ph. Toint, Dec 1989.
           Corrected version of AIRCRFTA by Tim Holy, Oct 2026.
""",
  :reference => raw"""
@article{More1990,
  title     = {A collection of nonlinear model problems. Computational Solution of Nonlinear Systems of Equations},
  author    = {Mor{\'e}, Jorge J.},
  journal   = {Lectures in Applied Mathematics},
  volume    = {26},
  pages     = {723--762},
  year      = {1990},
  publisher = {American Mathematical Society}
}
""",
  :lib => "CUTEst:AIRCRFTA2",
)
get_aircrfta2_nvar(; n::Int = default_nvar, kwargs...) = 8
get_aircrfta2_ncon(; n::Int = default_nvar, kwargs...) = 5
get_aircrfta2_nlin(; n::Int = default_nvar, kwargs...) = 0
get_aircrfta2_nnln(; n::Int = default_nvar, kwargs...) = 5
get_aircrfta2_nequ(; n::Int = default_nvar, kwargs...) = 5
get_aircrfta2_nineq(; n::Int = default_nvar, kwargs...) = 0
