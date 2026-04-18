boxbod_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "boxbod",
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
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/boxbod.dat

NIST/ITL StRD
Dataset Name:  BoxBOD            (BoxBOD.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 42)
               Certified Values  (lines 41 to 47)
               Data              (lines 61 to 66)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are described in detail in Box, Hunter and
               Hunter (1978).  The response variable is biochemical
               oxygen demand (BOD) in mg/l, and the predictor
               variable is incubation time in days.

Reference:     Box, G. P., W. G. Hunter, and J. S. Hunter (1978).
               Statistics for Experimenters.  
               New York, NY: Wiley, pp. 483-487.

Data:          1 Response  (y = biochemical oxygen demand)
               1 Predictor (x = incubation time)
               6 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Exponential Class
               2 Parameters (b1 and b2)

               y = b1*(1-exp[-b2*x])  +  e
T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_boxbod_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_boxbod_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_boxbod_nls_nequ(; n::Integer = default_nvar, kwargs...) = 6
