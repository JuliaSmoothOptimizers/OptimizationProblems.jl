dqrtic_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dqrtic",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.85427373e9,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://www.cs.cas.cz/matonoha/download/V1081.pdf, https://bitbucket.org/optrove/sif/src/master/DQRTIC.SIF",
  :notes => raw"""
Variable dimension diagonal quartic problem.

classification OUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""
Problem 157 (p. 87) in
A.R. Buckley,
Test functions for unconstrained minimization,
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

See also

problem 23 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic  
  ---
Problem :
Variable dimension diagonal quartic problem.
Source: problem 157 (p. 87) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.
SIF input: Ph. Toint, Dec 1989.
classification OUR2-AN-V-0
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

  :lib => "CUTEst:DQRTIC, Luksan:23",
)
get_dqrtic_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_dqrtic_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dqrtic_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dqrtic_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dqrtic_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dqrtic_nineq(; n::Integer = default_nvar, kwargs...) = 0
