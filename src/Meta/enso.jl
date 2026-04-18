enso_meta = Dict(
  :nvar => 9,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "enso",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/enso.dat

NIST/ITL StRD
Dataset Name:  ENSO              (ENSO.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  49)
               Certified Values  (lines 41 to  54)
               Data              (lines 61 to 228)

Procedure:     Nonlinear Least Squares Regression

Description:   The data are monthly averaged atmospheric pressure 
               differences between Easter Island and Darwin, 
               Australia.  This difference drives the trade winds in 
               the southern hemisphere.  Fourier analysis of the data
               reveals 3 significant cycles.  The annual cycle is the
               strongest, but cycles with periods of approximately 44
               and 26 months are also present.  These cycles
               correspond to the El Nino and the Southern Oscillation.
               Arguments to the SIN and COS functions are in radians.

Reference:     Kahaner, D., C. Moler, and S. Nash, (1989). 
               Numerical Methods and Software.  
               Englewood Cliffs, NJ: Prentice Hall, pp. 441-445.

Data:          1 Response  (y = atmospheric pressure)
               1 Predictor (x = time)
               168 Observations
               Average Level of Difficulty
               Observed Data

Model:         Miscellaneous Class
               9 Parameters (b1 to b9)

               y = b1 + b2*cos( 2*pi*x/12 ) + b3*sin( 2*pi*x/12 ) 
                      + b5*cos( 2*pi*x/b4 ) + b6*sin( 2*pi*x/b4 )
                      + b8*cos( 2*pi*x/b7 ) + b9*sin( 2*pi*x/b7 )  + e
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_enso_nvar(; n::Integer = default_nvar, kwargs...) = 9
get_enso_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_enso_nls_nequ(; n::Integer = default_nvar, kwargs...) = 168
