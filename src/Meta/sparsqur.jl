sparsqur_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "sparsqur",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1420.3125,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/SPARSQUR.SIF",
  :notes => raw"""
A sparse quartic problem

classification OUR2-AN-V-0

   Problem 53 in
   L. Luksan, C. Matonoha and J. Vlcek
   Modified CUTE problems for sparse unconstrained optimization,
   Technical Report 1081,
   Institute of Computer Science,
   Academy of Science of the Czech Republic
   http://www.cs.cas.cz/matonoha/download/V1081.pdf

 J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""
SIF input: Nick Gould, November 1995
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
  :lib => "CUTEst:SPARSQUR, Luksan:53",
)
get_sparsqur_nvar(; n::Int = default_nvar, kwargs...) = max(10, n)
get_sparsqur_ncon(; n::Int = default_nvar, kwargs...) = 0
get_sparsqur_nlin(; n::Int = default_nvar, kwargs...) = 0
get_sparsqur_nnln(; n::Int = default_nvar, kwargs...) = 0
get_sparsqur_nequ(; n::Int = default_nvar, kwargs...) = 0
get_sparsqur_nineq(; n::Int = default_nvar, kwargs...) = 0
