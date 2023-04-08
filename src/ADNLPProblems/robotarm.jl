export robotarm

# Minimize the time taken for a robot arm to travel between two points.

#  This is problem 8 in the COPS (Version 3) collection of 
#   E. Dolan and J. More
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#  classification OOR2-AN-V-V

function robotarm(;
  n::Int = default_nvar,
  L = 4.5,
  type::Val{T} = Val(Float64),
  kwargs...,
) where {T}
  N = max(2, div(n, 9))
  n = N + 1
  L = T(L)

  # x : vector of variables, of the form : [ρ(t=t1); ρ(t=t2); ... ρ(t=tf), θ(t=t1), ..., then ρ_dot, ..., then ρ_acc, .. ϕ_acc, tf]
  # There are N+1 values of each 9 variables 
  # x = [ρ, θ, ϕ, ρ_dot, θ_dot, ϕ_dot, ρ_acc, θ_acc, ϕ_acc, tf]

  # objective function 
  function f(x)
    x[end]
  end

  # constraints function 
  function c!(cx, x; L = L, n = n)
    # dynamic bounds on ρ_acc, θ_acc, ϕ_acc
    for i=1:n
      cx[i] = L * x[6n + i]
      cx[n + i] = x[7n + i] * ((L - x[i])^ 3 + x[i]^ 3) / 3 * sin(x[2n + i]) ^ 2
      cx[2 * n + i] = x[8n + i] * ((L - x[i]) ^ 3 + x[i] ^ 3) / 3
    end
    for i=1:(n-1)
      cx[3 * n + i] = x[1 + i] - x[i] - x[3n + i] * x[end] / n
      cx[4 * n - 1 + i] = x[n + 1 + i] - x[n + i] - x[4n + i] * x[end] / n
      cx[5 * n - 2 + i] = x[2n + 1 + i] - x[2n + i] - x[5n + i] * x[end] / n
      cx[6 * n - 3 + i] = x[3n + 1 + i] - x[3n + i] - x[6n + i] * x[end] / n
      cx[7 * n - 4 + i] = x[4n + 1 + i] - x[4n + i] - x[7n + i] * x[end] / n
      cx[8 * n - 5 + i] = x[5n + 1 + i] - x[5n + i] - x[8n + i] * x[end] / n
    end
    return cx
  end

  lcon = T[
    -ones(n)
    -ones(n)
    -ones(n)
    zeros(6N)
  ]

  ucon = T[
    ones(n)
    ones(n)
    ones(n)
    zeros(6N)
  ]

  # Building a feasible x0
  tf0 = T(1)
  θ0 = T[2π / 3 * (t / n)^2 for t = 1:n]
  θ0[1] = T(0)
  x0 = [L * ones(T, n); θ0; π * ones(T, n) / 4; zeros(T, 6n); tf0]

  # defining the bounds on the variables
  lvar = T[zeros(n); -π * ones(n); zeros(n); -Inf * ones(6n); 0]
  uvar = T[L * ones(n); π * ones(n); 2π * ones(n); Inf * ones(6n); Inf]
  lvar[1] = uvar[1] = lvar[n] = uvar[n] = T(L)
  lvar[n + 1] = uvar[n + 1] = T(0)
  lvar[2n] = uvar[2n] = T(2 * π / 3)
  lvar[2n + 1] = uvar[2n + 1] = lvar[3n] = uvar[3n] = T(π / 4)
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
                                          lvar[8n + 1] = uvar[8n + 1] = lvar[9n] = uvar[9n] = T(0)

  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "robotarm"; kwargs...)
end
