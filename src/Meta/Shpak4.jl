Shpak4_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "Shpak4",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.6774393168245545,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://www.math.md/publications/csjm/issues/v3-n2/7902/",
  :notes => raw"""
4th problem of
 Global optimization in one-dimensional case
 using analytically defined derivatives of
 objective function

 A.Shpak

 Computer Science Journal of Moldova, vol.3, no.2(8), 1995

 S. Goyette, Sherbrooke 2016/2017
""",
  :origin_notes => raw"""

""",
  :reference => raw"""
@article{Shpak1995,
  author  = {Shpak, Alexander},
  title   = {Global Optimization in One-Dimensional Case Using Analytically Defined Derivatives of Objective Function},
  journal = {Computer Science Journal of Moldova},
  year    = {1995},
  volume  = {3},
  number  = {2},
  pages   = {168--184},
  url     = {http://www.math.md/publications/csjm/issues/v3-n2/7902/}
}
""",
  :lib => "",
)
get_Shpak4_nvar(; n::Int = default_nvar, kwargs...) = 1
get_Shpak4_ncon(; n::Int = default_nvar, kwargs...) = 0
get_Shpak4_nlin(; n::Int = default_nvar, kwargs...) = 0
get_Shpak4_nnln(; n::Int = default_nvar, kwargs...) = 0
get_Shpak4_nequ(; n::Int = default_nvar, kwargs...) = 0
get_Shpak4_nineq(; n::Int = default_nvar, kwargs...) = 0
