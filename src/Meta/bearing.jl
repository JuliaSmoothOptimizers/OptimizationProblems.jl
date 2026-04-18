bearing_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "bearing",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 15.066210503336873,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Given observations of ns stages of a bearing species over n timesteps, 
minimize the loss between the observation and the computed law of paraneters : growth, mortality and number of specimens (g,m,x) 

This is problem 16 in the COPS (Version 3) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

classification OOR2-AN-V-V

Journal bearing problem
Michael Merritt - Summer 2000
COPS 2.0 - September 2000
COPS 3.0 - November 2002
COPS 3.1 - March 2004
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_bearing_nvar(;
  n::Integer = default_nvar,
  nx::Int = Int(round(sqrt(max(n, 1)))) - 2,
  ny::Int = Int(round(sqrt(max(n, 1)))) - 2,
  kwargs...,
) = (nx + 2) * (ny + 2)
get_bearing_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_bearing_nineq(; n::Integer = default_nvar, kwargs...) = 0
