genhumps_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "genhumps",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.5368401187477503e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://www.cs.cas.cz/matonoha/download/V1081.pdf, https://bitbucket.org/optrove/sif/src/master/GENHUMPS.SIF",
  :notes => raw"""
A multi-dimensional variant of HUMPS, a two dimensional function
with a lot of humps. The density of humps increases with the
parameter ZETA, making the problem more difficult.
The problem is nonconvex.

classification OUR2-AN-V-0

classification SUR2-AN-V-0
J.-P. Dussault, Rennes 09/2015.
""",
  :origin_notes => raw"""
problem 35 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

Ph. Toint, private communication, 1997.
SDIF input: N. Gould and Ph. Toint, November 1997.
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
  :lib => "CUTEst:GENHUMPS, Luksan:35",
)
get_genhumps_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_genhumps_ncon(; n::Int = default_nvar, kwargs...) = 0
get_genhumps_nlin(; n::Int = default_nvar, kwargs...) = 0
get_genhumps_nnln(; n::Int = default_nvar, kwargs...) = 0
get_genhumps_nequ(; n::Int = default_nvar, kwargs...) = 0
get_genhumps_nineq(; n::Int = default_nvar, kwargs...) = 0
