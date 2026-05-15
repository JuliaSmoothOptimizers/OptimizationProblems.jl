bennett5_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "bennett5",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/BENNETT5.SIF",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/bennett5.dat

NIST/ITL StRD
Dataset Name:  Bennett5          (Bennett5.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  43)
               Certified Values  (lines 41 to  48)
               Data              (lines 61 to 214)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               superconductivity magnetization modeling.  The
               response variable is magnetism, and the predictor
               variable is the log of time in minutes.

Reference:     Bennett, L., L. Swartzendruber, and H. Brown, 
               NIST (1994).  
               Superconductivity Magnetization Modeling.

Data:          1 Response Variable  (y = magnetism)
               1 Predictor Variable (x = log[time])
               154 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Miscellaneous Class
               3 Parameters (b1 to b3)

               y = b1 * (b2+x)**(-1/b3)  +  e
T. Migot, Montreal, 2023.

NIST Data fitting problem BENNETT5 given as an inconsistent set of
nonlinear equations.
Fit: y = b1 * (b2+x)**(-1/b3) + e

classification NOR2-MN-3-154
""",
  :origin_notes => raw"""
Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Reference:	Bennett, L., L. Swartzendruber, H. Brown, NIST (1994).
Superconductivity Magnetization Modeling.

SIF input: Nick Gould and Tyrone Rees, Oct 2015
""",
  :reference => raw"""""",
  :lib => "CUTEst:BENNETT5, NIST:Bennett5",
)
get_bennett5_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_bennett5_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_bennett5_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_bennett5_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_bennett5_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_bennett5_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_bennett5_nls_nequ(; n::Integer = default_nvar, kwargs...) = 154
