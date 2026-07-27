NZF1_meta = Dict(
  :nvar => 91,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "NZF1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 34698.351903102724,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://doi.org/10.1080/10556780500137116",
  :notes => raw"""
"Philippe Toint (private communication)"

classification SUR2-AN-V-0

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""

""",
  :reference => raw"""
@article{Price2006,
  title = {Exploiting problem structure in pattern search methods for unconstrained optimization},
  volume = {21},
  ISSN = {1029-4937},
  url = {https://doi.org/10.1080/10556780500137116},
  DOI = {10.1080/10556780500137116},
  number = {3},
  journal = {Optimization Methods and Software},
  publisher = {Informa UK Limited},
  author = {Price,  C. J. and Toint,  PH. L.},
  year = {2006},
  month = June,
  pages = {479--491}
}  
  """,
  :lib => "",
)
get_NZF1_nvar(; n::Int = default_nvar, kwargs...) = 13 * max(2, div(n, 13))
get_NZF1_ncon(; n::Int = default_nvar, kwargs...) = 0
get_NZF1_nlin(; n::Int = default_nvar, kwargs...) = 0
get_NZF1_nnln(; n::Int = default_nvar, kwargs...) = 0
get_NZF1_nequ(; n::Int = default_nvar, kwargs...) = 0
get_NZF1_nineq(; n::Int = default_nvar, kwargs...) = 0
get_NZF1_nls_nequ(; n::Int = default_nvar, kwargs...) = 6 * max(2, div(n, 13)) - 1
