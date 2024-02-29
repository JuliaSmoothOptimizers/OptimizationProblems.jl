# Given observations of ns stages of a marine species over n timesteps, 
# minimize the loss between the observation and the computed law of paraneters : growth, mortality and number of specimens (g,m,x) 

#   This is problem 6 in the COPS (Version 3) collection of 
#   E. Dolan and J. More'
#   see "Benchmarking Optimization Software with COPS"
#   Argonne National Labs Technical Report ANL/MCS-246 (2004)

#   classification OOR2-AN-V-V

# Marine Population Dynamics Problem
# Collocation formulation
# Alexander S. Bondarenko - Summer 1998
# COPS 2.0 - September 2000
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

export marine

function marine(args...; n::Int = default_nvar, nc::Int = 1, kwargs...)
  nlp = Model()

  nc = max(min(nc, 4), 1) # number of collocation points 
  ne = 8 # number of differential equations
  nm = 21 # number of measurements

  n = max(n, 3 * ne * nc + ne + 2 * ne)
  nh = Int(round((n - 2 * ne + 1) / (3 * ne * nc + ne))) # number of partition intervals

  # roots of k-th degree Legendre polynomial
  rho = if nc == 1
    0.5
  elseif nc == 2
    [0.21132486540519; 0.78867513459481]
  elseif nc == 3
    [0.11270166537926; 0.50000000000000; 0.88729833462074]
  elseif nc == 4
    [0.06943184420297; 0.33000947820757; 0.66999052179243; 0.93056815579703]
  end

  # param rho := 
  #   1   0.21132486540519
  #   2   0.78867513459481;

  # param rho := 
  #   1   0.11270166537926
  #   2   0.50000000000000
  #   3   0.88729833462074;

  # param rho := 
  #   1   0.06943184420297
  #   2   0.33000947820757
  #   3   0.66999052179243
  #   4   0.93056815579703; 

  # times at which observations made
  tau = [
    0.0
    0.5
    1.0
    1.5
    2.0
    2.5
    3.0
    3.5
    4.0
    4.5
    5.0
    5.5
    6.0
    6.5
    7.0
    7.5
    8.0
    8.5
    9.0
    9.5
    10.0
  ]

  # ODEs defined in [0,tf]        
  tf = tau[nm]
  h = tf / nh # uniform interval length
  t = [(i - 1) * h for i = 1:(nh + 1)] # partition

  # fact {j in 0..nc} := if j = 0 then 1 else (prod{i in 1..j} i); 
  fact = ones(nc + 1)
  for j = 1:nc
    fact[j + 1] = prod(i for i = 1:j)
  end

  # itau[i] is the largest integer k with t[k] <= tau[i]
  itau = [Int(min(nh, floor(tau[i] / h) + 1)) for i = 1:nm]

  # observations
  z = [
    20000.0 17000.0 10000.0 15000.0 12000.0 9000.0 7000.0 3000.0
    12445.0 15411.0 13040.0 13338.0 13484.0 8426.0 6615.0 4022.0
    7705.0 13074.0 14623.0 11976.0 12453.0 9272.0 6891.0 5020.0
    4664.0 8579.0 12434.0 12603.0 11738.0 9710.0 6821.0 5722.0
    2977.0 7053.0 11219.0 11340.0 13665.0 8534.0 6242.0 5695.0
    1769.0 5054.0 10065.0 11232.0 12112.0 9600.0 6647.0 7034.0
    943.0 3907.0 9473.0 10334.0 11115.0 8826.0 6842.0 7348.0
    581.0 2624.0 7421.0 10297.0 12427.0 8747.0 7199.0 7684.0
    355.0 1744.0 5369.0 7748.0 10057.0 8698.0 6542.0 7410.0
    223.0 1272.0 4713.0 6869.0 9564.0 8766.0 6810.0 6961.0
    137.0 821.0 3451.0 6050.0 8671.0 8291.0 6827.0 7525.0
    87.0 577.0 2649.0 5454.0 8430.0 7411.0 6423.0 8388.0
    49.0 337.0 2058.0 4115.0 7435.0 7627.0 6268.0 7189.0
    32.0 228.0 1440.0 3790.0 6474.0 6658.0 5859.0 7467.0
    17.0 168.0 1178.0 3087.0 6524.0 5880.0 5562.0 7144.0
    11.0 99.0 919.0 2596.0 5360.0 5762.0 4480.0 7256.0
    7.0 65.0 647.0 1873.0 4556.0 5058.0 4944.0 7538.0
    4.0 44.0 509.0 1571.0 4009.0 4527.0 4233.0 6649.0
    2.0 27.0 345.0 1227.0 3677.0 4229.0 3805.0 6378.0
    1.0 20.0 231.0 934.0 3197.0 3695.0 3159.0 6454.0
    1.0 12.0 198.0 707.0 2562.0 3163.0 3232.0 5566.0
  ]

  # var g {1..ne-1};  # growth rates
  # subject to g_bounds {s in 1..ne-1}: g[s] >= 0;
  g0 = zeros(ne - 1)
  # var m {1..ne};  # mortality rates
  # subject to m_bounds {s in 1..ne}: m[s] >= 0;
  m0 = zeros(ne)

  # The collocation approximation u is defined by the parameters v and w.
  # uc and Duc are, respectively, u and u' evaluated at the collocation points.

  #=
  var v {1..nh,1..ne};
  let {i in 1..itau[1], s in 1..ne}  v[i,s] := z[1,s];
  let {j in 2..nm, i in itau[j-1]+1..itau[j], s in 1..ne}  v[i,s] := z[j,s];
  let {i in itau[nm]+1..nh, s in 1..ne}  v[i,s] := z[nm,s];
  =#
  v0 = zeros(nh, ne) # nh x ne matrix
  for i = 1:tau[1], s = 1:ne
    v0[i, s] = z[1, s]
  end
  for j = 2:nm, i = (itau[j - 1] + 1):itau[j], s = 1:ne
    v0[i, s] = z[j, s]
  end
  for i = (itau[nm] + 1):nh, s = 1:ne
    v0[i, s] = z[nm, s]
  end
  # var w {1..nh,1..nc,1..ne}; # 0
  w0 = zeros(nh, nc, ne)

  #var uc {i in 1..nh, j in 1..nc, s in 1..ne} =  
  #  v[i,s] + h*sum {k in 1..nc} w[i,k,s]*(rho[j]^k/fact[k]);
  uc0 = zeros(nh, nc, ne)
  for i = 1:nh, j = 1:nc, s = 1:ne
    uc0[i, j, s] = v0[i, s] + h * sum(w0[i, k, s] * (rho[j]^k / fact[k + 1]) for k = 1:nc)
  end

  #var Duc {i in 1..nh, j in 1..nc, s in 1..ne} =  
  #  sum {k in 1..nc} w[i,k,s]*(rho[j]^(k-1)/fact[k-1]);
  Duc0 = zeros(nh, nc, ne)
  for i = 1:nh, j = 1:nc, s = 1:ne
    Duc0[i, j, s] = sum(w0[i, k, s] * (rho[j]^(k - 1) / fact[k]) for k = 1:nc)
  end

  @variable(nlp, g[1:(ne - 1)] >= 0)
  set_start_value.(g, g0)

  @variable(nlp, m[1:ne] >= 0)
  set_start_value.(m, m0)

  @variable(nlp, v[1:nh, 1:ne])
  set_start_value.(v, v0)

  @variable(nlp, w[1:nh, 1:nc, 1:ne])
  set_start_value.(w, w0)

  @variable(nlp, uc[1:nh, 1:nc, 1:ne])
  set_start_value.(uc, uc0)

  @variable(nlp, Duc[1:nh, 1:nc, 1:ne])
  set_start_value.(Duc, Duc0)

  @objective(
    nlp,
    Min,
    sum(
      sum(
        (
          v[itau[j], s] + (sum(
            w[itau[j], k, s] * (tau[j] - t[itau[j]])^k / (fact[k + 1] * h^(k - 1)) for k = 1:nc
          )) - z[j, s]
        )^2 for s = 1:ne
      ) for j = 1:nm
    )
  )
  @constraint(
    nlp,
    [i = 1:(nh - 1), s = 1:ne],
    v[i, s] + h * sum(w[i, j, s] / fact[j + 1] for j = 1:nc) - v[i + 1, s] == 0
  )
  @constraint(nlp, [i = 1:nh, j = 1:nc], Duc[i, j, 1] + (m[1] + g[1]) * uc[i, j, 1] == 0)
  @constraint(
    nlp,
    [i = 1:nh, j = 1:nc, s = 2:(ne - 1)],
    Duc[i, j, s] - g[s - 1] * uc[i, j, s - 1] + (m[s] + g[s]) * uc[i, j, s] == 0
  )
  @constraint(
    nlp,
    [i = 1:nh, j = 1:nc],
    Duc[i, j, ne] - g[ne - 1] * uc[i, j, ne - 1] + m[ne] * uc[i, j, ne] == 0
  )

  return nlp
end
