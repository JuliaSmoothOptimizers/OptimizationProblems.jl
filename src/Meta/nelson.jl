nelson_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "nelson",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 500.0,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :real,
  :url => "",
  :notes => raw"""
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/nelson.dat

NIST/ITL StRD
Dataset Name:  Nelson            (Nelson.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 43)
               Certified Values  (lines 41 to 48)
               Data              (lines 61 to 188)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a study involving
               the analysis of performance degradation data from
               accelerated tests, published in IEEE Transactions
               on Reliability.  The response variable is dialectric
               breakdown strength in kilo-volts, and the predictor
               variables are time in weeks and temperature in degrees
               Celcius.

Reference:     Nelson, W. (1981).  
               Analysis of Performance-Degradation Data.  
               IEEE Transactions on Reliability.
               Vol. 2, R-30, No. 2, pp. 149-155.

Data:          1 Response   ( y = dialectric breakdown strength) 
               2 Predictors (x1 = time; x2 = temperature)
               128 Observations
               Average Level of Difficulty
               Observed Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               log[y] = b1 - b2*x1 * exp[-b3*x2]  +  e

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_nelson_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_nelson_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_nelson_nls_nequ(; n::Integer = default_nvar, kwargs...) = 128
