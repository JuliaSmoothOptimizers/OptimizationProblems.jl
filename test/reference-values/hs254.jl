# Schittkowski (1987), problem 254: the start point and the solution
# (0, sqrt(3), 1) with f = -sqrt(3), as given in subroutine TP254 of K. Schittkowski's Fortran
# implementation, PROB.FOR in https://klaus-schittkowski.de/test_probs_src.zip. The objective is
# evaluated only where x3 = 1, so that the choice of logarithm does not matter.
[(x0 = [1, 1, 1], x = [0, sqrt(3), 1], obj = -sqrt(3), max_violation = 1e-12, rtol = 1e-12),]
