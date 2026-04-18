threepk_meta = Dict(
  :nvar => 30,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "threepk",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 20236.538579257834,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""

 Converted in Julia from https://github.com/mpf/Optimization-Test-Problems

**************************
 SET UP THE INITIAL DATA *
**************************
   Problem :
   *********
   A problem arising in the estimation of structured O/D matrix
   Source:
   M. Bierlaire, private communication
   see also
   M. Bierlaire and Ph. L. Toint,
   MEUSE: an origin-destination estimator that exploits structure,
   Transportation Research B, 29, 1, 47--60, 1995.
   SIF input: Ph. Toint, Dec 1989, Corrected July 1993.
   classification SUR2-MN-30-0
 Parameters
 Number of parking columns
 Number of centroids
 Gamma : general trust in the countings
 Objective for fill-up coefficients
 Inverse of the weights for fill-up coefficients
 Number of available countings
 Inverse of the weight on unknow cells
 Trip ends
 Some interesting values...
 Countings
 Inverse of the trusts in countings
 Coefficients pour les parkings
 O/D matrix
 A priori information, but not parkings
 Parking coefficients
 Unknown parking entries
 Countings
 Parking columns
 1,0
 2,0
 3,0
 4,0
 5,0
 0,1
 2,1
 3,1
 4,1
 5,1
 0,2
 1,2
 3,2
 4,2
 5,2
 Other columns
 0,3
 1,3
 2,3
 4,3
 5,3
 0,4
 1,4
 2,4
 3,4
 5,4
 0,5
 1,5
 2,5
 3,5
 4,5
 Variance minimization
 A priori information, but not parkings
 Parking coefficients  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_threepk_nvar(; n::Integer = default_nvar, kwargs...) = 30
get_threepk_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nineq(; n::Integer = default_nvar, kwargs...) = 0
