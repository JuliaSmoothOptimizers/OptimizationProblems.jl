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
  :url => "",
  :notes => raw"""
Source: problem 2 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Toint#33, Buckley#24
SIF input: Ph. Toint, Dec 1989.

classification SUR2-AN-V-0

problem 34 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification SUR2-AN-V-0
J.-P. Dussault, Rennes 09/2015.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_freuroth_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_freuroth_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_freuroth_nls_nequ(; n::Integer = default_nvar, kwargs...) = 2 * (n - 1)
