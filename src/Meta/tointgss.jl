tointgss_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "tointgss",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 891.6078431372565,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
   Toint's Gaussian problem.

   This problem has N-2 trivial groups, all of which have 1 nonlinear
   element

   Source: problem 21 in
   Ph.L. Toint,
   "Test problems for partially separable optimization and results
   for the routine PSPMIN",
   Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

   classification OUR2-AY-V-0

   Problem 56 in
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
get_tointgss_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_tointgss_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_tointgss_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tointgss_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_tointgss_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tointgss_nineq(; n::Integer = default_nvar, kwargs...) = 0
