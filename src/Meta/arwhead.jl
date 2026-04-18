arwhead_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "arwhead",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 297.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://www.cs.cas.cz/matonoha/download/V1081.pdf",
  :notes => raw"""
Arrow head problem.
A quartic problem whose Hessian is an arrow-head (downwards) with
diagonal central part and border-width of 1.

classification OUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""
Source:
Problem 55 in
A.R. Conn, N.I.M. Gould, M. Lescrenier and Ph.L. Toint,
Performance of a multifrontal scheme for partially separable
optimization,
Report 88/4, Dept of Mathematics, FUNDP (Namur, B), 1988.

See also

problem 1 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
""",
  :reference => raw"""
@techreport{LuksanMatonohaVlcek2003,
  author       = {Luksan, Ladislav and Matonoha, Cestmir and Vlcek, Jan},
  title        = {Modified {CUTE} Problems for Sparse Unconstrained Optimization},
  institution  = {Institute of Computer Science, Academy of Sciences of the Czech Republic},
  number       = {1081},
  year         = {2003},
  address      = {Prague, Czech Republic}
}  
""",
)
get_arwhead_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_arwhead_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_arwhead_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_arwhead_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_arwhead_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_arwhead_nineq(; n::Integer = default_nvar, kwargs...) = 0
