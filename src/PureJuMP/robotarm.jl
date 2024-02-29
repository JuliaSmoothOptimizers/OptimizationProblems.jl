# Minimize the time taken for a robot arm to travel between two points.

#  This is problem 8 in the COPS (Version 3) collection of 
#   E. Dolan and J. More
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#  classification OOR2-AN-V-V

# x : vector of variables, of the form : [ρ(t=t1); ρ(t=t2); ... ρ(t=tf), θ(t=t1), ..., then ρ_dot, ..., then ρ_acc, .. ϕ_acc, tf]
# There are N+1 values of each 9 variables 
# x = [ρ, θ, ϕ, ρ_dot, θ_dot, ϕ_dot, ρ_acc, θ_acc, ϕ_acc, tf]

export robotarm

function robotarm(; n::Int = default_nvar, L = 4.5, kwargs...)
  N = max(2, div(n, 9))
  n = N + 1

  nlp = Model()

  # defining the bounds on the variables
  lvar = [zeros(n); -π * ones(n); zeros(n); -Inf * ones(6n); 0]
  uvar = [L * ones(n); π * ones(n); 2π * ones(n); Inf * ones(6n); Inf]
  lvar[1] = uvar[1] = lvar[n] = uvar[n] = L
  lvar[n + 1] = uvar[n + 1] = 0
  lvar[2n] = uvar[2n] = 2 * π / 3
  lvar[2n + 1] = uvar[2n + 1] = lvar[3n] = uvar[3n] = π / 4
  lvar[3n + 1] =
    uvar[3n + 1] =
      lvar[4n] =
        uvar[4n] =
          lvar[4n + 1] =
            uvar[4n + 1] =
              lvar[5n] =
                uvar[5n] =
                  lvar[5n + 1] =
                    uvar[5n + 1] =
                      lvar[6n] =
                        uvar[6n] =
                          lvar[6n + 1] =
                            uvar[6n + 1] =
                              lvar[7n] =
                                uvar[7n] =
                                  lvar[7n + 1] =
                                    uvar[7n + 1] =
                                      lvar[8n] =
                                        uvar[8n] =
                                          lvar[8n + 1] = uvar[8n + 1] = lvar[9n] = uvar[9n] = 0

  # Building a feasible x0
  tf0 = 1
  θ0 = [2π / 3 * (t / n)^2 for t = 1:n]
  θ0[1] = 0
  x0 = [L * ones(n); θ0; π * ones(n) / 4; zeros(6n); tf0]

  @variable(nlp, lvar[i] <= x[i = 1:length(x0)] <= uvar[i], start = x0[i])

  @objective(nlp, Min, x[end])

  for j = 1:n
    @constraint(nlp, -1 <= L * x[6n + j] <= 1)
  end
  for j = 1:n
    @constraint(nlp, -1 <= x[7n + j] * ((L - x[j])^3 + x[j]^3) / 3 * sin(x[2n + j])^2 <= 1)
  end
  for j = 1:n
    @constraint(nlp, -1 <= x[8n + j] * ((L - x[j])^3 + x[j]^3) / 3 <= 1)
  end
  for j = 1:(n - 1)
    @constraint(nlp, x[j + 1] - x[j] - x[3n + j] * x[end] / n == 0)
  end
  for j = 1:(n - 1)
    @constraint(nlp, x[n + 1 + j] - x[n + j] - x[4n + j] * x[end] / n == 0)
  end
  for j = 1:(n - 1)
    @constraint(nlp, x[2n + 1 + j] - x[2n + j] - x[5n + j] * x[end] / n == 0)
  end
  for j = 1:(n - 1)
    @constraint(nlp, x[3n + 1 + j] - x[3n + j] - x[6n + j] * x[end] / n == 0)
  end
  for j = 1:(n - 1)
    @constraint(nlp, x[4n + 1 + j] - x[4n + j] - x[7n + j] * x[end] / n == 0)
  end
  for j = 1:(n - 1)
    @constraint(nlp, x[5n + 1 + j] - x[5n + j] - x[8n + j] * x[end] / n == 0)
  end

  return nlp
end
