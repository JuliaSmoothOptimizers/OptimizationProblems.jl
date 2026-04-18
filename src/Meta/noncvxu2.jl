noncvxu2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "noncvxu2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.639748043568829e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A nonconvex unconstrained function with a unique minimum value

classification OUR2-AN-V-0

Problem 43 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf
J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_noncvxu2_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_noncvxu2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_noncvxu2_nineq(; n::Integer = default_nvar, kwargs...) = 0
