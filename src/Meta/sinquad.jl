sinquad_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "sinquad",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.6561000000000001,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/SINQUAD.SIF",
  :notes => raw"""
Another function with nontrivial groups and
   repetitious elements.

classification OUR2-AY-V-0

   Problem 51 in
   L. Luksan, C. Matonoha and J. Vlcek
   Modified CUTE problems for sparse unconstrained optimization,
   Technical Report 1081,
   Institute of Computer Science,
   Academy of Science of the Czech Republic
   http://www.cs.cas.cz/matonoha/download/V1081.pdf

 J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""
N. Gould, private communication.

SIF input: N. Gould, Dec 1989.
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
  :lib => "CUTEst:SINQUAD, Luksan:51",
)
get_sinquad_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_sinquad_ncon(; n::Int = default_nvar, kwargs...) = 0
get_sinquad_nlin(; n::Int = default_nvar, kwargs...) = 0
get_sinquad_nnln(; n::Int = default_nvar, kwargs...) = 0
get_sinquad_nequ(; n::Int = default_nvar, kwargs...) = 0
get_sinquad_nineq(; n::Int = default_nvar, kwargs...) = 0
