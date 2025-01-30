# Goddard Rocket Problem
# Trapezoidal formulation
# COPS 2.0 - September 2000
# COPS 3.0 - November 2002
# COPS 3.1 - March 2004

function rocket(; n::Int = default_nvar, kwargs...)
  h_0 = 1.0
  v_0 = 0.0
  m_0 = 1.0
  g_0 = 1.0
  T_c = 3.5
  h_c = 500.0
  v_c = 620.0
  m_c = 0.6

  c = 0.5*sqrt(g_0 * h_0)
  m_f = m_c * m_0
  D_c = 0.5 * v_c * (m_0 / g_0)
  T_max = T_c * m_0 * g_0

  model = Model()

  @variables(model, begin
    1.0 <= h[i=0:n],          (start=1.0)
    0.0 <= v[i=0:n],          (start=i/n*(1.0 - i/n))
    m_f <= m[i=0:n] <= m_0,   (start=(m_f - m_0)*(i/n) + m_0)
    0.0 <= T[i=0:n] <= T_max, (start=T_max/2.0)
    0.0 <= step,              (start=1/n)
  end)

  @NLexpressions(model, begin
    D[i=0:n],  D_c*v[i]^2*exp(-h_c*(h[i] - h_0))/h_0
    g[i=0:n],  g_0 * (h_0 / h[i])^2
    dh[i=0:n], v[i]
    dv[i=0:n], (T[i] - D[i] - m[i]*g[i]) / m[i]
    dm[i=0:n], -T[i]/c
  end)

  @objective(model, Max, h[n])

  # Dynamics
  @NLconstraints(model, begin
    con_dh[i=1:n], h[i] == h[i-1] + 0.5 * step * (dh[i] + dh[i-1])
    con_dv[i=1:n], v[i] == v[i-1] + 0.5 * step * (dv[i] + dv[i-1])
    con_dm[i=1:n], m[i] == m[i-1] + 0.5 * step * (dm[i] + dm[i-1])
  end)
  # Boundary constraints
  @constraints(model, begin
    h_ic, h[0] == h_0
    v_ic, v[0] == v_0
    m_ic, m[0] == m_0
    m_fc, m[n] == m_f
  end)

  return model
end

