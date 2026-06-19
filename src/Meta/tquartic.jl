tquartic_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "tquartic",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.81,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/TQUARTIC.SIF",
  :notes => raw"""
A quartic function with nontrivial groups and
   repetitious elements.

classification SUR2-AN-V-0#

   Problem 57 in
   L. Luksan, C. Matonoha and J. Vlcek
   Modified CUTE problems for sparse unconstrained optimization,
   Technical Report 1081,
   Institute of Computer Science,
   Academy of Science of the Czech Republic
   http://www.cs.cas.cz/matonoha/download/V1081.pdf

 J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""
Ph. Toint, private communication.

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@techreport{LuksanMatonohaVlcek2003,
  author       = {Luksan, Ladislav and Matonoha, Cestmir and Vlcek, Jan},
  title        = {Modified {CUTE} Problems for Sparse Unconstrained Optimization},
    institution  = {Institute of Computer Science, Academy of Sciences of the Czech Republic},
  number       = {1081},
  year         = {2003},
  address      = {Prague, Czech Republic},
  url          = {http://www.cs.cas.cz/matonoha/download/V1081.pdf},
  }  
  """,
  :lib => "CUTEst:TQUARTIC, Luksan:57",
)
get_tquartic_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_tquartic_ncon(; n::Int = default_nvar, kwargs...) = 0
get_tquartic_nlin(; n::Int = default_nvar, kwargs...) = 0
get_tquartic_nnln(; n::Int = default_nvar, kwargs...) = 0
get_tquartic_nequ(; n::Int = default_nvar, kwargs...) = 0
get_tquartic_nineq(; n::Int = default_nvar, kwargs...) = 0
get_tquartic_nls_nequ(; n::Int = default_nvar, kwargs...) = n - 1
