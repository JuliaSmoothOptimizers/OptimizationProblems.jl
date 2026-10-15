# Start point x0 = -1 from subroutine TIUD11 (label 440) of L. Luksan, C. Matonoha and J. Vlcek's
# Fortran code, http://www.cs.cas.cz/luksan/opt/test11.for. The objective at x = (1, 2, 3) is the
# value of the function defined in subroutine TFFU11 (label 440) of that code, evaluated by hand:
# (1 - 1)^2 + 100 ((1 - 1^2)^2 + (1 - 2^2)^2) = 900.
[
  (kwargs = (n = 10,), x0 = fill(-1, 10), atol = 0),
  (kwargs = (n = 3,), x = [1, 2, 3], obj = 900, atol = 0, rtol = 1e-12),
]
