curly30_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "curly30",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.02038297204649621,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/CURLY30.SIF",
  :notes => raw"""
A banded function with semi-bandwidth b and
negative curvature near the starting point.

Note that the initial point in the reference below is erroneous.
In this model, we use the starting point specified in the
original SIF model, part of the CUTE collection.

See also

problems 8, 9, 10 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

A banded function with semi-bandwidth 30 and
negative curvature near the starting point

classification OUR2-AN-V-0

classification SUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""
Nick Gould

SIF input: Nick Gould, September 1997.
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
  :lib => "CUTEst:CURLY30",
)
get_curly30_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_curly30_ncon(; n::Int = default_nvar, kwargs...) = 0
get_curly30_nlin(; n::Int = default_nvar, kwargs...) = 0
get_curly30_nnln(; n::Int = default_nvar, kwargs...) = 0
get_curly30_nequ(; n::Int = default_nvar, kwargs...) = 0
get_curly30_nineq(; n::Int = default_nvar, kwargs...) = 0
