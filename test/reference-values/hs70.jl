# Hock and Schittkowski (1981), problem 70: f(x0) as printed on p. 91 (.9818596), and the
# solution to the 12 digits given in subroutine TP70 of K. Schittkowski's Fortran implementation,
# PROB.FOR in https://klaus-schittkowski.de/test_probs_src.zip. The formulation reproduces the
# optimal value to about 9 digits (relative difference 2e-9), so the tolerance there is 1e-8.
[
  (x0 = [2, 4, 0.04, 2], x = [2, 4, 0.04, 2], obj = 0.9818596, rtol = 1e-7),
  (
    x = [12.2769537557, 4.63178796886, 0.312862470961, 2.02929031570],
    obj = 0.749846356143e-2,
    max_violation = 0,
    rtol = 1e-8,
  ),
]
