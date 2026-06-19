freuroth_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "freuroth",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 99556.5,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "http://www.cs.cas.cz/matonoha/download/V1081.pdf, https://bitbucket.org/optrove/sif/src/master/FREUROTH.SIF",
  :notes => raw"""
The Freudentstein and Roth test problem

classification SUR2-AN-V-0
J.-P. Dussault, Rennes 09/2015.
""",
  :origin_notes => raw"""
problem 34 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

problem 2 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Toint#33, Buckley#24

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
  :lib => "CUTEst:FREUROTH, Luksan:34",
)
get_freuroth_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_freuroth_ncon(; n::Int = default_nvar, kwargs...) = 0
get_freuroth_nlin(; n::Int = default_nvar, kwargs...) = 0
get_freuroth_nnln(; n::Int = default_nvar, kwargs...) = 0
get_freuroth_nequ(; n::Int = default_nvar, kwargs...) = 0
get_freuroth_nineq(; n::Int = default_nvar, kwargs...) = 0
get_freuroth_nls_nequ(; n::Int = default_nvar, kwargs...) = 2 * (n - 1)
