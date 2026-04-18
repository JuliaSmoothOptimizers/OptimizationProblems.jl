Shpak5_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "Shpak5",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.00842222549507,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
 fifth problem of
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
get_Shpak5_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_Shpak5_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak5_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak5_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak5_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_Shpak5_nineq(; n::Integer = default_nvar, kwargs...) = 0
