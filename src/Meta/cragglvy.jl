cragglvy_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "cragglvy",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 52823.07152952862,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Extended Cragg and Levy problem.
The Hessian matrix is 7-diagonal.

Source: problem 32 in
Ph. L. Toint,
Test problems for partially separable optimization and results
for the routine PSPMIN,
Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

See also

problem 7 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification OUR2-AY-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_cragglvy_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_cragglvy_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_cragglvy_nineq(; n::Integer = default_nvar, kwargs...) = 0
