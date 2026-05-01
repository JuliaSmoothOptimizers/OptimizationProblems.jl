danwood_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "danwood",
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
  :url => "https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/danwood.dat, https://bitbucket.org/optrove/sif/src/master/DANWOOD.SIF",
  :notes => raw"""
NIST/ITL StRD
Dataset Name:  DanWood           (DanWood.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 42)
               Certified Values  (lines 41 to 47)
               Data              (lines 61 to 66)

Procedure:     Nonlinear Least Squares Regression

Description:   These data and model are described in Daniel and Wood
               (1980), and originally published in E.S.Keeping, 
               "Introduction to Statistical Inference," Van Nostrand
               Company, Princeton, NJ, 1962, p. 354.  The response
               variable is energy radieted from a carbon filament
               lamp per cm**2 per second, and the predictor variable
               is the absolute temperature of the filament in 1000
               degrees Kelvin.

Reference:     Daniel, C. and F. S. Wood (1980).
               Fitting Equations to Data, Second Edition. 
               New York, NY:  John Wiley and Sons, pp. 428-431.

Data:          1 Response Variable  (y = energy)
               1 Predictor Variable (x = temperature)
               6 Observations
               Lower Level of Difficulty
               Observed Data

Model:         Miscellaneous Class
               2 Parameters (b1 and b2)

               y  = b1*x**b2  +  e

T. Migot, Montreal, 2023.
  """,
  :origin_notes => raw"""
Problem :
NIST Data fitting problem DANWOOD given as an inconsistent set of
nonlinear equations (incorrect formulation). See DANIWOOS.SIF for
the correct formulation
Fit: y  = (b1*x)**b2  +  e
Source:  Problem from the NIST nonlinear regression test set
http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml
Daniel, C. and F. S. Wood (1980).
Fitting Equations to Data, Second Edition.
New York, NY:  John Wiley and Sons, pp. 428-431.
SIF input: Nick Gould and Tyrone Rees, Oct 2015
classification NOR2-MN-2-6
""",
  :reference => raw"""
@book{DanielWood1980,
  author    = {C. Daniel and F. S. Wood},
  title     = {Fitting Equations to Data},
  edition   = {Second},
  publisher = {John Wiley and Sons},
  address   = {New York, NY},
  year      = {1980},
  pages     = {428--431}
}  
  """,
  :lib => "CUTEst:DANWOOD, NIST:DanWood",
)
get_danwood_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_danwood_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_danwood_nls_nequ(; n::Integer = default_nvar, kwargs...) = 6
