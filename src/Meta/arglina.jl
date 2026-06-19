arglina_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "arglina",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1145/355934.355936, https://bitbucket.org/optrove/sif/src/master/ARGLINA.SIF",
  :notes => raw"""
Linear function - full rank

classification SUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 32 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#80 (with different N and M)

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@article{MoreGarbowHillstrom1981,
  author  = {Mor{\'e}, Jorge J. and Garbow, Burton S. and Hillstrom, Kenneth E.},
  title   = {Testing Unconstrained Optimization Software},
  journal = {ACM Transactions on Mathematical Software},
  year    = {1981},
  volume  = {7},
  number  = {1},
  pages   = {17--41},
  doi     = {10.1145/355934.355936}
}  
""",
  :lib => "CUTEst:ARGLINA",
)
get_arglina_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_arglina_ncon(; n::Int = default_nvar, kwargs...) = 0
get_arglina_nlin(; n::Int = default_nvar, kwargs...) = 0
get_arglina_nnln(; n::Int = default_nvar, kwargs...) = 0
get_arglina_nequ(; n::Int = default_nvar, kwargs...) = 0
get_arglina_nineq(; n::Int = default_nvar, kwargs...) = 0
get_arglina_nls_nequ(; n::Int = default_nvar, kwargs...) = 2 * n
