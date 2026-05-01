trig_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "trig",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 61.482500487413226,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://www.researchgate.net/publication/325314400_Sparse_Test_Problems_for_Unconstrained_Optimization",
  :notes => raw"""
  Another trigonometric function
  """,
  :origin_notes => raw"""
  Problem 9 in
  L. Luksan, C. Matonoha and J. Vlcek
  Sparse Test Problems for Unconstrained Optimization,
  Technical Report 1064,
  Institute of Computer Science,
  Academy of Science of the Czech Republic
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
  :lib => "LuksanSparse:9",
)

get_trig_nvar(; n::Integer = default_nvar, kwargs...) = n
get_trig_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_trig_nineq(; n::Integer = default_nvar, kwargs...) = 0
