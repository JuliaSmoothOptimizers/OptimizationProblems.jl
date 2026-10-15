# Hock and Schittkowski (1981), problem 69: f(x0) as printed on p. 90 (-631.3525, which the
# formulation reproduces to 6 digits), and the solution to the 12 digits given in subroutine TP69
# of K. Schittkowski's Fortran implementation, PROB.FOR in
# https://klaus-schittkowski.de/test_probs_src.zip
[
  (x0 = [1, 1, 1, 1], x = [1, 1, 1, 1], obj = -631.3525, rtol = 1e-5),
  (
    x = [0.293714180830e-01, 0.119025343488e+01, 0.233946796758, 0.791667815694],
    obj = -0.956712887064e+03,
    max_violation = 1e-8,
    rtol = 1e-9,
  ),
]
