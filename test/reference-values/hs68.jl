# Hock and Schittkowski (1981), problem 68: f(x0) as printed on p. 90 (-.2618407, which the
# formulation reproduces to 6 digits), and the solution to the 12 digits given in subroutine TP68
# of K. Schittkowski's Fortran implementation, PROB.FOR in
# https://klaus-schittkowski.de/test_probs_src.zip
[
  (x0 = [1, 1, 1, 1], x = [1, 1, 1, 1], obj = -0.2618407, rtol = 1e-5),
  (
    x = [0.678587452312e-01, 0.364617174165e+01, 0.266175189694e-03, 0.894862212037],
    obj = -0.920425020704,
    max_violation = 1e-6,
    rtol = 1e-9,
  ),
]
