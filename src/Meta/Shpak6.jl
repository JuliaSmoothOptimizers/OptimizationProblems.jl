Shpak6_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "Shpak6",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.2566659310721418,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
 6th problem of
 Global optimization in one-dimensional case
 using analytically defined derivatives of
 objective function

 A.Shpak

Computer Science Journal of Moldova, vol.3, no.2(8), 1995

 S. Goyette, Sherbrooke 2016/2017
  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_Shpak6_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_Shpak6_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak6_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak6_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak6_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak6_nineq(; n::Integer = default_nvar, kwargs...) = 0
