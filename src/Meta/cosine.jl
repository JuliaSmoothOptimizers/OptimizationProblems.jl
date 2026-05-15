cosine_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "cosine",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 86.88067362714695,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/COSINE.SIF",
  :notes => raw"""
The cosine function.

Another function with nontrivial groups and
repetitious elements.

classification OUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""
problem 6 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

N. Gould, private communication.

SIF input: N. Gould, Jan 1996
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

  :lib => "CUTEst:COSINE, Luksan:6",
)
get_cosine_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_cosine_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_cosine_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_cosine_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_cosine_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_cosine_nineq(; n::Integer = default_nvar, kwargs...) = 0
