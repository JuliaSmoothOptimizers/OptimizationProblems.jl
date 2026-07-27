bqp1var_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "bqp1var",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.3125,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/BQP1VAR.SIF",
  :notes => raw"""
classification QBR2-AN-1-0
""",
  :origin_notes => raw"""
a one variable box-constrained quadratic

SIF input: Nick Gould, March 1992
""",
  :reference => raw"""
@article{Gould2015CUTEst,
  author    = {Nicholas I. M. Gould and Dominique Orban and Philippe L. Toint},
  title     = {{CUTEst}: a constrained and unconstrained testing environment with safe threads for mathematical optimization},
  journal   = {ACM Transactions on Mathematical Software},
  volume    = {40},
  number    = {3},
  year      = {2015},
  pages     = {1--25},
  doi       = {10.1145/2786885}
}  
  """,
  :lib => "CUTEst:BQP1VAR",
)
get_bqp1var_nvar(; n::Int = default_nvar, kwargs...) = 1
get_bqp1var_ncon(; n::Int = default_nvar, kwargs...) = 1
get_bqp1var_nlin(; n::Int = default_nvar, kwargs...) = 1
get_bqp1var_nnln(; n::Int = default_nvar, kwargs...) = 0
get_bqp1var_nequ(; n::Int = default_nvar, kwargs...) = 0
get_bqp1var_nineq(; n::Int = default_nvar, kwargs...) = 1
