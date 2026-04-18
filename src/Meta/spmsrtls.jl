spmsrtls_meta = Dict(
  :nvar => max(Int(round((default_nvar + 2) / 3)), 34) * 3 - 2,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "spmsrtls",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 49.32387140878785,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
   Liu and Nocedal tridiagonal matrix square root problem.

   Source:  problem 151 (p. 93) in
   A.R. Buckley,
   "Test functions for unconstrained minimization",
   TR 1989CS-3, Mathematics, statistics and computing centre,
   Dalhousie University, Halifax (CDN), 1989.

   See also

   problem 54 in
   L. Luksan, C. Matonoha and J. Vlcek
   Modified CUTE problems for sparse unconstrained optimization,
   Technical Report 1081,
   Institute of Computer Science,
   Academy of Science of the Czech Republic

   http://www.cs.cas.cz/matonoha/download/V1081.pdf

   classification SUR2-AN-V-V  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_spmsrtls_nvar(; n::Integer = default_nvar, kwargs...) = max(Int(round((n + 2) / 3)), 34) * 3 - 2
get_spmsrtls_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_spmsrtls_nls_nequ(; n::Integer = default_nvar, kwargs...) =
  7 * max(Int(round((n + 2) / 3)), 34) - 8
