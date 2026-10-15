# Hock and Schittkowski (1981), problem 83: f(x0) as printed on p. 102 (-32217, to 5 digits), and
# the solution to the 12 digits given in subroutine TP83 of K. Schittkowski's Fortran
# implementation, PROB.FOR in https://klaus-schittkowski.de/test_probs_src.zip
[
  (x0 = [78, 33, 27, 27, 27], x = [78, 33, 27, 27, 27], obj = -32217, rtol = 2e-5),
  (
    x = [78, 33, 29.9952560253, 45, 36.7758129081],
    obj = -0.306655386717e5,
    max_violation = 1e-8,
    rtol = 1e-9,
  ),
]
