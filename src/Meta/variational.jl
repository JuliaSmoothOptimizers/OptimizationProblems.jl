variational_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "variational",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :academic,
  :url => "",
  :notes => raw"""
 Discretization of a variational problem

   Problem 15 in
   L. Luksan, C. Matonoha and J. Vlcek
   Sparse Test Problems for Unconstrained Optimization,
   Technical Report 1064,
   Institute of Computer Science,
   Academy of Science of the Czech Republic

   https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)

get_variational_nvar(; n::Integer = default_nvar, kwargs...) = n
get_variational_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_variational_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_variational_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_variational_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_variational_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_variational_nls_nequ(; n::Integer = default_nvar, kwargs...) = 0
