genrose_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "genrose",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 405.1064193957891,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/GENROSE.SIF",
  :notes => raw"""
Generalized Rosenbrock function.

classification SUR2-AN-V-0

problem 36 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
""",
  :origin_notes => raw"""
problem 5 in
S. Nash,
"Newton-type minimization via the Lanczos process",
SIAM J. Num. Anal. 21, 1984, 770-788.

SIF input: Nick Gould, Oct 1992.
""",
  :reference => raw"""
@article{Nash1984SIAMNA,
  author  = {Nash, Stephen G.},
  title   = {Newton-Type Minimization via the {Lanczos} Method},
  journal = {SIAM Journal on Numerical Analysis},
  year    = {1984},
  volume  = {21},
  number  = {4},
  pages   = {770--788},
  doi     = {10.1137/0721052}
}  
  """,
  :lib => "CUTEst:GENROSE, Luksan:36",
)
get_genrose_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_genrose_ncon(; n::Int = default_nvar, kwargs...) = 0
get_genrose_nlin(; n::Int = default_nvar, kwargs...) = 0
get_genrose_nnln(; n::Int = default_nvar, kwargs...) = 0
get_genrose_nequ(; n::Int = default_nvar, kwargs...) = 0
get_genrose_nineq(; n::Int = default_nvar, kwargs...) = 0
get_genrose_nls_nequ(; n::Int = default_nvar, kwargs...) = 2 * (n - 1) + 1
