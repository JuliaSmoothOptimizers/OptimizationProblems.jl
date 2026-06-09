nazareth_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "nazareth",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :academic,
  :url => "https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization",
  :notes => raw"""
Sparse modification of the Nazareth trigonometric function
Problem 8 in
L. Luksan, C. Matonoha and J. Vlcek
Sparse Test Problems for Unconstrained Optimization,
Technical Report 1064,
Institute of Computer Science,
Academy of Science of the Czech Republic
https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization
""",
  :origin_notes => raw"""

""",
  :reference => raw"""
@techreport{LuksanMatonohaVlcek2010Sparse,
  author       = {Luksan, Ladislav and Matonoha, Ctirad and Vlcek, Jan},
  title        = {Sparse Test Problems for Unconstrained Optimization},
  institution  = {Institute of Computer Science, Academy of Sciences of the Czech Republic},
  number       = {V-1064},
  year         = {2010},
  address      = {Prague, Czech Republic},
  url          = {https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization}
  }
    """,
  :lib => "LuksanSparse:8",
)

get_nazareth_nvar(; n::Integer = default_nvar, kwargs...) = n
get_nazareth_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_nazareth_nls_nequ(; n::Integer = default_nvar, kwargs...) = n
