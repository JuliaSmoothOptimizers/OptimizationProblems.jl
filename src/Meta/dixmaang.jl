dixmaang_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaang",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2495.8333333333335,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
The Dixon-Maany test problem (version E by default)

Source:
L. C. W. Dixon and Z. Maany,
A family of test problems with sparse Hessians for unconstrained
optimization,
TR 206, Numerical Optimization Centre, Hatfield Polytechnic, 1988.

See also

problems 11, 12, 13, 14 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification OUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""":origin_notes => raw"""""",
  :reference => raw"""""",
)
get_dixmaang_nvar(; n::Integer = default_nvar, kwargs...) = 3 * max(1, div(n, 3))
get_dixmaang_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixmaang_nineq(; n::Integer = default_nvar, kwargs...) = 0
