vibrbeam_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "vibrbeam",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 8231.27506726856,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
   https://bitbucket.org/optrove/sif/src/master/VIBRBEAM.SIF
   A nonlinear least-squares problem arising from laser-Doppler
   measurements of a vibrating beam.  The data correspond to a simulated
   experiment where two laser-Doppler velocimeters take measurements
   at random points along the centreline of the beam.  These measurements
   consist of a position (x), an incident angle (p) and the magnitude
   of the velocity along the line of sight (v).
   The problem is then to fit

                         2      3                    2     3
       v = (c + c x + c x  + c x ) cos[ d + d x + d x + d x  - p ]
             0   1     2      3          0   1     2     3
           <---- magnitude ----->       <------ phase ----->

   in the least-squares sense.

   Source: 
   a modification of an exercize for L. Watson course on LANCELOT in
   the Spring 1993. Compared to the original proposal, the unnecessary
   elements were removed as well as an unnecessary constraint on the phase.

   SIF input: Ph. L. Toint, May 1993, based on a proposal by
              D. E. Montgomery, Virginia Tech., April 1993.

   classification  SUR2-MN-8-0

  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_vibrbeam_nvar(; n::Integer = default_nvar, kwargs...) = 8
get_vibrbeam_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_vibrbeam_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_vibrbeam_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_vibrbeam_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_vibrbeam_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_vibrbeam_nls_nequ(; n::Integer = default_nvar, kwargs...) = 30
