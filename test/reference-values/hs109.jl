# Hock and Schittkowski (1981), problem 109: starting point and f(x0) as printed on p. 118, and
# the solution to the 12 digits given in subroutine TP109 of K. Schittkowski's Fortran
# implementation, PROB.FOR in https://klaus-schittkowski.de/test_probs_src.zip. The equality
# constraints have terms of size 1e5, so the rounded solution satisfies them to about 1e-6.
[
  (x0 = zeros(9), x = zeros(9), obj = 0, atol = 0),
  (
    x = [
      674.888100445,
      1134.17039470,
      0.133569060261,
      -0.371152592466,
      252,
      252,
      201.464535316,
      426.660777226,
      368.494083867,
    ],
    obj = 0.536206927538e4,
    max_violation = 2e-6,
    rtol = 1e-9,
  ),
]
