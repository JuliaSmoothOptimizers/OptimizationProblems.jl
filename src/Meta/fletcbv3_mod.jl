fletcbv3_mod_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "fletcbv3_mod",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.018792460907141866,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "http://www.cs.cas.cz/matonoha/download/V1081.pdf",
  :notes => raw"""
classification OUR2-AN-V-0

J.-P. Dussault, Rennes 09/2015.
""",
  :origin_notes => raw"""
The first problem given by
R. Fletcher,
"An optimal positive definite update for sparse Hessian matrices"
Numerical Analysis report NA/145, University of Dundee, 1992.

Scaled version.

SIF input: Nick Gould, Oct 1992.

problem 30 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf
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
  :lib => "Luksan:30",
)
get_fletcbv3_mod_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_fletcbv3_mod_ncon(; n::Int = default_nvar, kwargs...) = 0
get_fletcbv3_mod_nlin(; n::Int = default_nvar, kwargs...) = 0
get_fletcbv3_mod_nnln(; n::Int = default_nvar, kwargs...) = 0
get_fletcbv3_mod_nequ(; n::Int = default_nvar, kwargs...) = 0
get_fletcbv3_mod_nineq(; n::Int = default_nvar, kwargs...) = 0
