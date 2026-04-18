lanczos3_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "lanczos3",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/lanczos3.dat

NIST/ITL StRD
Dataset Name:  Lanczos3          (Lanczos3.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 46)
               Certified Values  (lines 41 to 51)
               Data              (lines 61 to 84)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are taken from an example discussed in
               Lanczos (1956).  The data were generated to 5-digits
               of accuracy using
               f(x) = 0.0951*exp(-x) + 0.8607*exp(-3*x) 
                                     + 1.5576*exp(-5*x).

Reference:     Lanczos, C. (1956).
               Applied Analysis.
               Englewood Cliffs, NJ:  Prentice Hall, pp. 272-280.

Data:          1 Response  (y)
               1 Predictor (x)
               24 Observations
               Lower Level of Difficulty
               Generated Data

Model:         Exponential Class
               6 Parameters (b1 to b6)

               y = b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x)  +  e
T. Migot, Montreal, 2023.
               """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_lanczos3_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_lanczos3_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos3_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos3_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_lanczos3_nls_nequ(; n::Integer = default_nvar, kwargs...) = 24
