bt1_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "bt1",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source:  problem 13 (p. 103) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/bt1.mod

classification QQR2-AN-2-1

A. Cebola, Curitiba 10/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_bt1_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_bt1_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_bt1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_bt1_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_bt1_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_bt1_nineq(; n::Integer = default_nvar, kwargs...) = 0
