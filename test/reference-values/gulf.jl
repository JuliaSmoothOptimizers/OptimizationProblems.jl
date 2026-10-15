# J. J. Moré, B. S. Garbow and K. E. Hillstrom, "Testing unconstrained optimization software",
# ACM Trans. Math. Software 7(1), 17-41, 1981, problem 11 (Gulf research and development
# function): starting point, and the solution x* = (50, 25, 1.5), where every residual is zero
# for any number of observations m with 3 <= m <= 100.
[
  (x0 = [5, 2.5, 0.15], atol = 0),
  (x = [50, 25, 1.5], obj = 0, residual_sum_of_squares = 0, atol = 1e-20),
  (kwargs = (m = 10,), x = [50, 25, 1.5], obj = 0, residual_sum_of_squares = 0, atol = 1e-20),
]
