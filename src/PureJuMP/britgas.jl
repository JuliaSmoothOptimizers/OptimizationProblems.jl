#
# Converted in Julia from https://github.com/mpf/Optimization-Test-Problems
#
#
#**************************
# SET UP THE INITIAL DATA *
#**************************
#   Problem :
#   *********
#   A simple high pressure gas network problem for British Gas.
#   Invented Data, but real network.
#   23 node network, 8 hour operation.
#   Source:
#   N. Gould, private communication,March 1990.
#   SIF input: N. Gould, March 1990.
#   classification OOI2-RN-450-360
#   Period is the number of time periods
#   Define problem parameters
#   Define a few helpful parameters
# P(J,) = pressure at node J at time T
# flows along pipes connecting nodes (network dependent)
# Q(I,J,T) = flow from node I to node J at time T
# flows through machines connecting nodes (network dependent)
# F(I,J,T) = flow from node I to node J at time T
# compressor ratios (network dependent)
# R(I,J,T) = compressor ratio between node I to node J at time T
#  the input supply at node 1
#  the output supplies at nodes 16 and 23
#   Define objective function group
#   mass balance at nodes
#  compressor ratio constraints.
#   Panhandle pipe equations (nonlinear)
#   The constants for the mass balance equations (guesses).
#X  BRITGAS   M1,(T)    -8.0
#X  BRITGAS   M16,(T)   1.0
#X  BRITGAS   M23,(T)   1.0
#  All flows and pressures are positive
#  compressor ratio bounds
#  crmax = maximum compressor ratio (guess)
# flows along pipes connecting nodes (network dependent)
# Q(I,J,T) = flow from node I to node J at time T
#  horsepower at compressors
#  compressor ratios
#   for the mass balance constraint at each node
#   For the panhandle constraints along each pipe
#  objective function = sum of power generated at compressors.
#  zi (inlet compressibility) and k are constants (guesses)
#  compressor ratio constraints
#  mass balance constraints
#  v = volume coefficient for mass around node (guess)
#RD V                   0.0
#  Pressure drop equations
#  H = friction coefficient (guess)
#RD H                   0.1
#   Solution
export britgas

function britgas(; n::Int = default_nvar, kwargs...)
  nlp = Model()

  hours  = 8
  nodes  = 23
  theta  = 0.75
  a  = 1.0
  b  = 1.0
  alpha  = 1.8539
  dt  = 1.0
  one  = 1.0
  omega  = 1.0 + (-1.0 * (0.75))
  s  = -1 + (8)
  crmax  = 10.0
  k  = 1.0
  zi  = 1.0
  ktzi  = (1.0) * (1.0)
  v  = 1.0
  vddt  = (1.0) * ((1.0) / (1.0))
  h  = 0.01

  @variable(nlp, 0.0 <= p1_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_0 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p1_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p2_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p3_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p4_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p5_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p6_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p7_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p8_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p9_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p10_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p11_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p12_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p13_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p14_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p15_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p16_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p17_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p18_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p19_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p20_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p21_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p22_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= p23_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_0 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_2_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q1_17_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q2_3_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q4_5_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q5_6_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q7_8_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_9_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_10_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q8_11_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q11_12_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q12_13_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_14_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q13_15_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q15_16_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q17_18_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q18_19_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q20_21_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q21_22_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0e-16 <= q22_23_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_1 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_1 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_1 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_1 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_2 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_2 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_2 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_2 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_3 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_3 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_3 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_3 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_4 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_4 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_4 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_4 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_5 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_5 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_5 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_5 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_6 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_6 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_6 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_6 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_7 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_7 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_7 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_7 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= f3_4_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f5_7_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= f19_20_8 <= Inf, start = 1.0)
  @variable(nlp, 1.0 <= r3_4_8 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r5_7_8 <= 10.0, start = 1.0)
  @variable(nlp, 1.0 <= r19_20_8 <= 10.0, start = 1.0)
  @variable(nlp, 0.0 <= in1_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_1 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= in1_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_2 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= in1_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_3 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= in1_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_4 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= in1_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_5 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= in1_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_6 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= in1_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_7 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= in1_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out16_8 <= Inf, start = 1.0)
  @variable(nlp, 0.0 <= out23_8 <= Inf, start = 1.0)

  @NLobjective(nlp, Min, 
    f3_4_1 * ((abs(r3_4_1)^0.22e+0) - 1.0e+0 )  + f5_7_1 * ((abs(r5_7_1)^0.22e+0) - 1.0e+0 )  + f19_20_1 * ((abs(r19_20_1)^0.22e+0) - 1.0e+0 )  + f3_4_2 * ((abs(r3_4_2)^0.22e+0) - 1.0e+0 )  + f5_7_2 * ((abs(r5_7_2)^0.22e+0) - 1.0e+0 )  + f19_20_2 * ((abs(r19_20_2)^0.22e+0) - 1.0e+0 )  + f3_4_3 * ((abs(r3_4_3)^0.22e+0) - 1.0e+0 )  + f5_7_3 * ((abs(r5_7_3)^0.22e+0) - 1.0e+0 )  + f19_20_3 * ((abs(r19_20_3)^0.22e+0) - 1.0e+0 )  + f3_4_4 * ((abs(r3_4_4)^0.22e+0) - 1.0e+0 )  + f5_7_4 * ((abs(r5_7_4)^0.22e+0) - 1.0e+0 )  + f19_20_4 * ((abs(r19_20_4)^0.22e+0) - 1.0e+0 )  + f3_4_5 * ((abs(r3_4_5)^0.22e+0) - 1.0e+0 )  + f5_7_5 * ((abs(r5_7_5)^0.22e+0) - 1.0e+0 )  + f19_20_5 * ((abs(r19_20_5)^0.22e+0) - 1.0e+0 )  + f3_4_6 * ((abs(r3_4_6)^0.22e+0) - 1.0e+0 )  + f5_7_6 * ((abs(r5_7_6)^0.22e+0) - 1.0e+0 )  + f19_20_6 * ((abs(r19_20_6)^0.22e+0) - 1.0e+0 )  + f3_4_7 * ((abs(r3_4_7)^0.22e+0) - 1.0e+0 )  + f5_7_7 * ((abs(r5_7_7)^0.22e+0) - 1.0e+0 )  + f19_20_7 * ((abs(r19_20_7)^0.22e+0) - 1.0e+0 )  + f3_4_8 * ((abs(r3_4_8)^0.22e+0) - 1.0e+0 )  + f5_7_8 * ((abs(r5_7_8)^0.22e+0) - 1.0e+0 )  + f19_20_8 * ((abs(r19_20_8)^0.22e+0) - 1.0e+0 ) 
  )
  @NLconstraint(nlp, m1_1,
p1_1 / ((1.0e+0)+(1.0e+0)*p1_1) - p1_0 / ((1.0e+0)+(1.0e+0)*p1_0) - 0.75*q1_17_1 - 0.75*q1_2_1 + in1_1 - 0.25*q1_17_0 - 0.25*q1_2_0 == 0
  )
  @NLconstraint(nlp, m2_1,
p2_1 / ((1.0e+0)+(1.0e+0)*p2_1) - p2_0 / ((1.0e+0)+(1.0e+0)*p2_0) - 0.75*q2_3_1 + 0.75*q1_2_1 - 0.25*q2_3_0 + 0.25*q1_2_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_1,
p3_1 / ((1.0e+0)+(1.0e+0)*p3_1) - p3_0 / ((1.0e+0)+(1.0e+0)*p3_0) - f3_4_1 + 0.75*q2_3_1 + 0.25*q2_3_0 == 0
  )
  @NLconstraint(nlp, m4_1,
p4_1 / ((1.0e+0)+(1.0e+0)*p4_1) - p4_0 / ((1.0e+0)+(1.0e+0)*p4_0) - 0.75*q4_5_1 + f3_4_1 - 0.25*q4_5_0 == 0
  )
  @NLconstraint(nlp, m5_1,
p5_1 / ((1.0e+0)+(1.0e+0)*p5_1) - p5_0 / ((1.0e+0)+(1.0e+0)*p5_0) - 0.75*q5_6_1 - f5_7_1 + 0.75*q4_5_1 - 0.25*q5_6_0 + 0.25*q4_5_0 == 0
  )
  @NLconstraint(nlp, m6_1,
p6_1 / ((1.0e+0)+(1.0e+0)*p6_1) - p6_0 / ((1.0e+0)+(1.0e+0)*p6_0) + 0.75*q5_6_1 + 0.25*q5_6_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_1,
p7_1 / ((1.0e+0)+(1.0e+0)*p7_1) - p7_0 / ((1.0e+0)+(1.0e+0)*p7_0) - 0.75*q7_8_1 + f5_7_1 - 0.25*q7_8_0 == 0
  )
  @NLconstraint(nlp, m8_1,
p8_1 / ((1.0e+0)+(1.0e+0)*p8_1) - p8_0 / ((1.0e+0)+(1.0e+0)*p8_0) - 0.75*q8_9_1 - 0.75*q8_10_1 - 0.75*q8_11_1 + 0.75*q7_8_1 - 0.25*q8_9_0 - 0.25*q8_10_0 - 0.25*q8_11_0 + 0.25*q7_8_0 == 0
  )
  @NLconstraint(nlp, m9_1,
p9_1 / ((1.0e+0)+(1.0e+0)*p9_1) - p9_0 / ((1.0e+0)+(1.0e+0)*p9_0) + 0.75*q8_9_1 + 0.25*q8_9_0 == 0
  )
  @NLconstraint(nlp, m10_1,
p10_1 / ((1.0e+0)+(1.0e+0)*p10_1) - p10_0 / ((1.0e+0)+(1.0e+0)*p10_0) + 0.75*q8_10_1 + 0.25*q8_10_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_1,
p11_1 / ((1.0e+0)+(1.0e+0)*p11_1) - p11_0 / ((1.0e+0)+(1.0e+0)*p11_0) - 0.75*q11_12_1 + 0.75*q8_11_1 - 0.25*q11_12_0 + 0.25*q8_11_0 == 0
  )
  @NLconstraint(nlp, m12_1,
p12_1 / ((1.0e+0)+(1.0e+0)*p12_1) - p12_0 / ((1.0e+0)+(1.0e+0)*p12_0) - 0.75*q12_13_1 + 0.75*q11_12_1 - 0.25*q12_13_0 + 0.25*q11_12_0 == 0
  )
  @NLconstraint(nlp, m13_1,
p13_1 / ((1.0e+0)+(1.0e+0)*p13_1) - p13_0 / ((1.0e+0)+(1.0e+0)*p13_0) - 0.75*q13_14_1 - 0.75*q13_15_1 + 0.75*q12_13_1 - 0.25*q13_14_0 - 0.25*q13_15_0 + 0.25*q12_13_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_1,
p14_1 / ((1.0e+0)+(1.0e+0)*p14_1) - p14_0 / ((1.0e+0)+(1.0e+0)*p14_0) + 0.75*q13_14_1 + 0.25*q13_14_0 == 0
  )
  @NLconstraint(nlp, m15_1,
p15_1 / ((1.0e+0)+(1.0e+0)*p15_1) - p15_0 / ((1.0e+0)+(1.0e+0)*p15_0) - 0.75*q15_16_1 + 0.75*q13_15_1 - 0.25*q15_16_0 + 0.25*q13_15_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_1,
p16_1 / ((1.0e+0)+(1.0e+0)*p16_1) - p16_0 / ((1.0e+0)+(1.0e+0)*p16_0) + 0.75*q15_16_1 + 0.25*q15_16_0 - out16_1 == 0
  )
  @NLconstraint(nlp, m17_1,
p17_1 / ((1.0e+0)+(1.0e+0)*p17_1) - p17_0 / ((1.0e+0)+(1.0e+0)*p17_0) - 0.75*q17_18_1 + 0.75*q1_17_1 - 0.25*q17_18_0 + 0.25*q1_17_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_1,
p18_1 / ((1.0e+0)+(1.0e+0)*p18_1) - p18_0 / ((1.0e+0)+(1.0e+0)*p18_0) - 0.75*q18_19_1 + 0.75*q17_18_1 - 0.25*q18_19_0 + 0.25*q17_18_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_1,
p19_1 / ((1.0e+0)+(1.0e+0)*p19_1) - p19_0 / ((1.0e+0)+(1.0e+0)*p19_0) - f19_20_1 + 0.75*q18_19_1 + 0.25*q18_19_0 == 0
  )
  @NLconstraint(nlp, m20_1,
p20_1 / ((1.0e+0)+(1.0e+0)*p20_1) - p20_0 / ((1.0e+0)+(1.0e+0)*p20_0) - 0.75*q20_21_1 + f19_20_1 - 0.25*q20_21_0 == 0
  )
  @NLconstraint(nlp, m21_1,
p21_1 / ((1.0e+0)+(1.0e+0)*p21_1) - p21_0 / ((1.0e+0)+(1.0e+0)*p21_0) - 0.75*q21_22_1 + 0.75*q20_21_1 - 0.25*q21_22_0 + 0.25*q20_21_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_1,
p22_1 / ((1.0e+0)+(1.0e+0)*p22_1) - p22_0 / ((1.0e+0)+(1.0e+0)*p22_0) - 0.75*q22_23_1 + 0.75*q21_22_1 - 0.25*q22_23_0 + 0.25*q21_22_0 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_1,
p23_1 / ((1.0e+0)+(1.0e+0)*p23_1) - p23_0 / ((1.0e+0)+(1.0e+0)*p23_0) + 0.75*q22_23_1 + 0.25*q22_23_0 - out23_1 == 0
  )
  @NLconstraint(nlp, c3_4_1,
p3_1 * r3_4_1 - p4_1 == 0
  )
  @NLconstraint(nlp, c5_7_1,
p5_1 * r5_7_1 - p7_1 == 0
  )
  @NLconstraint(nlp, c19_20_1,
p19_1 * r19_20_1 - p20_1 == 0
  )
  @NLconstraint(nlp, p1_2_1,
p1_1 * p1_1 - p2_1 * p2_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_1+p2_1)) * ((abs(q1_2_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_1,
p1_1 * p1_1 - p17_1 * p17_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_1+p17_1)) * ((abs(q1_17_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_1,
p2_1 * p2_1 - p3_1 * p3_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_1+p3_1)) * ((abs(q2_3_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_1,
p4_1 * p4_1 - p5_1 * p5_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_1+p5_1)) * ((abs(q4_5_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_1,
p5_1 * p5_1 - p6_1 * p6_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_1+p6_1)) * ((abs(q5_6_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_1,
p7_1 * p7_1 - p8_1 * p8_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_1+p8_1)) * ((abs(q7_8_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_1,
p8_1 * p8_1 - p9_1 * p9_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_1+p9_1)) * ((abs(q8_9_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_1,
p8_1 * p8_1 - p10_1 * p10_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_1+p10_1)) * ((abs(q8_10_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_1,
p8_1 * p8_1 - p11_1 * p11_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_1+p11_1)) * ((abs(q8_11_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_1,
p11_1 * p11_1 - p12_1 * p12_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_1+p12_1)) * ((abs(q11_12_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_1,
p12_1 * p12_1 - p13_1 * p13_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_1+p13_1)) * ((abs(q12_13_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_1,
p13_1 * p13_1 - p14_1 * p14_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_1+p14_1)) * ((abs(q13_14_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_1,
p13_1 * p13_1 - p15_1 * p15_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_1+p15_1)) * ((abs(q13_15_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_1,
p15_1 * p15_1 - p16_1 * p16_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_1+p16_1)) * ((abs(q15_16_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_1,
p17_1 * p17_1 - p18_1 * p18_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_1+p18_1)) * ((abs(q17_18_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_1,
p18_1 * p18_1 - p19_1 * p19_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_1+p19_1)) * ((abs(q18_19_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_1,
p20_1 * p20_1 - p21_1 * p21_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_1+p21_1)) * ((abs(q20_21_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_1,
p21_1 * p21_1 - p22_1 * p22_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_1+p22_1)) * ((abs(q21_22_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_1,
p22_1 * p22_1 - p23_1 * p23_1 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_1+p23_1)) * ((abs(q22_23_1))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, m1_2,
p1_2 / ((1.0e+0)+(1.0e+0)*p1_2) - p1_1 / ((1.0e+0)+(1.0e+0)*p1_1) - 0.75*q1_17_2 - 0.75*q1_2_2 + in1_2 - 0.25*q1_17_1 - 0.25*q1_2_1 == 0
  )
  @NLconstraint(nlp, m2_2,
p2_2 / ((1.0e+0)+(1.0e+0)*p2_2) - p2_1 / ((1.0e+0)+(1.0e+0)*p2_1) - 0.75*q2_3_2 + 0.75*q1_2_2 - 0.25*q2_3_1 + 0.25*q1_2_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_2,
p3_2 / ((1.0e+0)+(1.0e+0)*p3_2) - p3_1 / ((1.0e+0)+(1.0e+0)*p3_1) - f3_4_2 + 0.75*q2_3_2 + 0.25*q2_3_1 == 0
  )
  @NLconstraint(nlp, m4_2,
p4_2 / ((1.0e+0)+(1.0e+0)*p4_2) - p4_1 / ((1.0e+0)+(1.0e+0)*p4_1) - 0.75*q4_5_2 + f3_4_2 - 0.25*q4_5_1 == 0
  )
  @NLconstraint(nlp, m5_2,
p5_2 / ((1.0e+0)+(1.0e+0)*p5_2) - p5_1 / ((1.0e+0)+(1.0e+0)*p5_1) - 0.75*q5_6_2 - f5_7_2 + 0.75*q4_5_2 - 0.25*q5_6_1 + 0.25*q4_5_1 == 0
  )
  @NLconstraint(nlp, m6_2,
p6_2 / ((1.0e+0)+(1.0e+0)*p6_2) - p6_1 / ((1.0e+0)+(1.0e+0)*p6_1) + 0.75*q5_6_2 + 0.25*q5_6_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_2,
p7_2 / ((1.0e+0)+(1.0e+0)*p7_2) - p7_1 / ((1.0e+0)+(1.0e+0)*p7_1) - 0.75*q7_8_2 + f5_7_2 - 0.25*q7_8_1 == 0
  )
  @NLconstraint(nlp, m8_2,
p8_2 / ((1.0e+0)+(1.0e+0)*p8_2) - p8_1 / ((1.0e+0)+(1.0e+0)*p8_1) - 0.75*q8_9_2 - 0.75*q8_10_2 - 0.75*q8_11_2 + 0.75*q7_8_2 - 0.25*q8_9_1 - 0.25*q8_10_1 - 0.25*q8_11_1 + 0.25*q7_8_1 == 0
  )
  @NLconstraint(nlp, m9_2,
p9_2 / ((1.0e+0)+(1.0e+0)*p9_2) - p9_1 / ((1.0e+0)+(1.0e+0)*p9_1) + 0.75*q8_9_2 + 0.25*q8_9_1 == 0
  )
  @NLconstraint(nlp, m10_2,
p10_2 / ((1.0e+0)+(1.0e+0)*p10_2) - p10_1 / ((1.0e+0)+(1.0e+0)*p10_1) + 0.75*q8_10_2 + 0.25*q8_10_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_2,
p11_2 / ((1.0e+0)+(1.0e+0)*p11_2) - p11_1 / ((1.0e+0)+(1.0e+0)*p11_1) - 0.75*q11_12_2 + 0.75*q8_11_2 - 0.25*q11_12_1 + 0.25*q8_11_1 == 0
  )
  @NLconstraint(nlp, m12_2,
p12_2 / ((1.0e+0)+(1.0e+0)*p12_2) - p12_1 / ((1.0e+0)+(1.0e+0)*p12_1) - 0.75*q12_13_2 + 0.75*q11_12_2 - 0.25*q12_13_1 + 0.25*q11_12_1 == 0
  )
  @NLconstraint(nlp, m13_2,
p13_2 / ((1.0e+0)+(1.0e+0)*p13_2) - p13_1 / ((1.0e+0)+(1.0e+0)*p13_1) - 0.75*q13_14_2 - 0.75*q13_15_2 + 0.75*q12_13_2 - 0.25*q13_14_1 - 0.25*q13_15_1 + 0.25*q12_13_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_2,
p14_2 / ((1.0e+0)+(1.0e+0)*p14_2) - p14_1 / ((1.0e+0)+(1.0e+0)*p14_1) + 0.75*q13_14_2 + 0.25*q13_14_1 == 0
  )
  @NLconstraint(nlp, m15_2,
p15_2 / ((1.0e+0)+(1.0e+0)*p15_2) - p15_1 / ((1.0e+0)+(1.0e+0)*p15_1) - 0.75*q15_16_2 + 0.75*q13_15_2 - 0.25*q15_16_1 + 0.25*q13_15_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_2,
p16_2 / ((1.0e+0)+(1.0e+0)*p16_2) - p16_1 / ((1.0e+0)+(1.0e+0)*p16_1) + 0.75*q15_16_2 + 0.25*q15_16_1 - out16_2 == 0
  )
  @NLconstraint(nlp, m17_2,
p17_2 / ((1.0e+0)+(1.0e+0)*p17_2) - p17_1 / ((1.0e+0)+(1.0e+0)*p17_1) - 0.75*q17_18_2 + 0.75*q1_17_2 - 0.25*q17_18_1 + 0.25*q1_17_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_2,
p18_2 / ((1.0e+0)+(1.0e+0)*p18_2) - p18_1 / ((1.0e+0)+(1.0e+0)*p18_1) - 0.75*q18_19_2 + 0.75*q17_18_2 - 0.25*q18_19_1 + 0.25*q17_18_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_2,
p19_2 / ((1.0e+0)+(1.0e+0)*p19_2) - p19_1 / ((1.0e+0)+(1.0e+0)*p19_1) - f19_20_2 + 0.75*q18_19_2 + 0.25*q18_19_1 == 0
  )
  @NLconstraint(nlp, m20_2,
p20_2 / ((1.0e+0)+(1.0e+0)*p20_2) - p20_1 / ((1.0e+0)+(1.0e+0)*p20_1) - 0.75*q20_21_2 + f19_20_2 - 0.25*q20_21_1 == 0
  )
  @NLconstraint(nlp, m21_2,
p21_2 / ((1.0e+0)+(1.0e+0)*p21_2) - p21_1 / ((1.0e+0)+(1.0e+0)*p21_1) - 0.75*q21_22_2 + 0.75*q20_21_2 - 0.25*q21_22_1 + 0.25*q20_21_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_2,
p22_2 / ((1.0e+0)+(1.0e+0)*p22_2) - p22_1 / ((1.0e+0)+(1.0e+0)*p22_1) - 0.75*q22_23_2 + 0.75*q21_22_2 - 0.25*q22_23_1 + 0.25*q21_22_1 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_2,
p23_2 / ((1.0e+0)+(1.0e+0)*p23_2) - p23_1 / ((1.0e+0)+(1.0e+0)*p23_1) + 0.75*q22_23_2 + 0.25*q22_23_1 - out23_2 == 0
  )
  @NLconstraint(nlp, c3_4_2,
p3_2 * r3_4_2 - p4_2 == 0
  )
  @NLconstraint(nlp, c5_7_2,
p5_2 * r5_7_2 - p7_2 == 0
  )
  @NLconstraint(nlp, c19_20_2,
p19_2 * r19_20_2 - p20_2 == 0
  )
  @NLconstraint(nlp, p1_2_2,
p1_2 * p1_2 - p2_2 * p2_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_2+p2_2)) * ((abs(q1_2_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_2,
p1_2 * p1_2 - p17_2 * p17_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_2+p17_2)) * ((abs(q1_17_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_2,
p2_2 * p2_2 - p3_2 * p3_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_2+p3_2)) * ((abs(q2_3_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_2,
p4_2 * p4_2 - p5_2 * p5_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_2+p5_2)) * ((abs(q4_5_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_2,
p5_2 * p5_2 - p6_2 * p6_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_2+p6_2)) * ((abs(q5_6_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_2,
p7_2 * p7_2 - p8_2 * p8_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_2+p8_2)) * ((abs(q7_8_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_2,
p8_2 * p8_2 - p9_2 * p9_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_2+p9_2)) * ((abs(q8_9_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_2,
p8_2 * p8_2 - p10_2 * p10_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_2+p10_2)) * ((abs(q8_10_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_2,
p8_2 * p8_2 - p11_2 * p11_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_2+p11_2)) * ((abs(q8_11_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_2,
p11_2 * p11_2 - p12_2 * p12_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_2+p12_2)) * ((abs(q11_12_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_2,
p12_2 * p12_2 - p13_2 * p13_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_2+p13_2)) * ((abs(q12_13_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_2,
p13_2 * p13_2 - p14_2 * p14_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_2+p14_2)) * ((abs(q13_14_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_2,
p13_2 * p13_2 - p15_2 * p15_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_2+p15_2)) * ((abs(q13_15_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_2,
p15_2 * p15_2 - p16_2 * p16_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_2+p16_2)) * ((abs(q15_16_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_2,
p17_2 * p17_2 - p18_2 * p18_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_2+p18_2)) * ((abs(q17_18_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_2,
p18_2 * p18_2 - p19_2 * p19_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_2+p19_2)) * ((abs(q18_19_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_2,
p20_2 * p20_2 - p21_2 * p21_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_2+p21_2)) * ((abs(q20_21_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_2,
p21_2 * p21_2 - p22_2 * p22_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_2+p22_2)) * ((abs(q21_22_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_2,
p22_2 * p22_2 - p23_2 * p23_2 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_2+p23_2)) * ((abs(q22_23_2))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, m1_3,
p1_3 / ((1.0e+0)+(1.0e+0)*p1_3) - p1_2 / ((1.0e+0)+(1.0e+0)*p1_2) - 0.75*q1_17_3 - 0.75*q1_2_3 + in1_3 - 0.25*q1_17_2 - 0.25*q1_2_2 == 0
  )
  @NLconstraint(nlp, m2_3,
p2_3 / ((1.0e+0)+(1.0e+0)*p2_3) - p2_2 / ((1.0e+0)+(1.0e+0)*p2_2) - 0.75*q2_3_3 + 0.75*q1_2_3 - 0.25*q2_3_2 + 0.25*q1_2_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_3,
p3_3 / ((1.0e+0)+(1.0e+0)*p3_3) - p3_2 / ((1.0e+0)+(1.0e+0)*p3_2) - f3_4_3 + 0.75*q2_3_3 + 0.25*q2_3_2 == 0
  )
  @NLconstraint(nlp, m4_3,
p4_3 / ((1.0e+0)+(1.0e+0)*p4_3) - p4_2 / ((1.0e+0)+(1.0e+0)*p4_2) - 0.75*q4_5_3 + f3_4_3 - 0.25*q4_5_2 == 0
  )
  @NLconstraint(nlp, m5_3,
p5_3 / ((1.0e+0)+(1.0e+0)*p5_3) - p5_2 / ((1.0e+0)+(1.0e+0)*p5_2) - 0.75*q5_6_3 - f5_7_3 + 0.75*q4_5_3 - 0.25*q5_6_2 + 0.25*q4_5_2 == 0
  )
  @NLconstraint(nlp, m6_3,
p6_3 / ((1.0e+0)+(1.0e+0)*p6_3) - p6_2 / ((1.0e+0)+(1.0e+0)*p6_2) + 0.75*q5_6_3 + 0.25*q5_6_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_3,
p7_3 / ((1.0e+0)+(1.0e+0)*p7_3) - p7_2 / ((1.0e+0)+(1.0e+0)*p7_2) - 0.75*q7_8_3 + f5_7_3 - 0.25*q7_8_2 == 0
  )
  @NLconstraint(nlp, m8_3,
p8_3 / ((1.0e+0)+(1.0e+0)*p8_3) - p8_2 / ((1.0e+0)+(1.0e+0)*p8_2) - 0.75*q8_9_3 - 0.75*q8_10_3 - 0.75*q8_11_3 + 0.75*q7_8_3 - 0.25*q8_9_2 - 0.25*q8_10_2 - 0.25*q8_11_2 + 0.25*q7_8_2 == 0
  )
  @NLconstraint(nlp, m9_3,
p9_3 / ((1.0e+0)+(1.0e+0)*p9_3) - p9_2 / ((1.0e+0)+(1.0e+0)*p9_2) + 0.75*q8_9_3 + 0.25*q8_9_2 == 0
  )
  @NLconstraint(nlp, m10_3,
p10_3 / ((1.0e+0)+(1.0e+0)*p10_3) - p10_2 / ((1.0e+0)+(1.0e+0)*p10_2) + 0.75*q8_10_3 + 0.25*q8_10_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_3,
p11_3 / ((1.0e+0)+(1.0e+0)*p11_3) - p11_2 / ((1.0e+0)+(1.0e+0)*p11_2) - 0.75*q11_12_3 + 0.75*q8_11_3 - 0.25*q11_12_2 + 0.25*q8_11_2 == 0
  )
  @NLconstraint(nlp, m12_3,
p12_3 / ((1.0e+0)+(1.0e+0)*p12_3) - p12_2 / ((1.0e+0)+(1.0e+0)*p12_2) - 0.75*q12_13_3 + 0.75*q11_12_3 - 0.25*q12_13_2 + 0.25*q11_12_2 == 0
  )
  @NLconstraint(nlp, m13_3,
p13_3 / ((1.0e+0)+(1.0e+0)*p13_3) - p13_2 / ((1.0e+0)+(1.0e+0)*p13_2) - 0.75*q13_14_3 - 0.75*q13_15_3 + 0.75*q12_13_3 - 0.25*q13_14_2 - 0.25*q13_15_2 + 0.25*q12_13_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_3,
p14_3 / ((1.0e+0)+(1.0e+0)*p14_3) - p14_2 / ((1.0e+0)+(1.0e+0)*p14_2) + 0.75*q13_14_3 + 0.25*q13_14_2 == 0
  )
  @NLconstraint(nlp, m15_3,
p15_3 / ((1.0e+0)+(1.0e+0)*p15_3) - p15_2 / ((1.0e+0)+(1.0e+0)*p15_2) - 0.75*q15_16_3 + 0.75*q13_15_3 - 0.25*q15_16_2 + 0.25*q13_15_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_3,
p16_3 / ((1.0e+0)+(1.0e+0)*p16_3) - p16_2 / ((1.0e+0)+(1.0e+0)*p16_2) + 0.75*q15_16_3 + 0.25*q15_16_2 - out16_3 == 0
  )
  @NLconstraint(nlp, m17_3,
p17_3 / ((1.0e+0)+(1.0e+0)*p17_3) - p17_2 / ((1.0e+0)+(1.0e+0)*p17_2) - 0.75*q17_18_3 + 0.75*q1_17_3 - 0.25*q17_18_2 + 0.25*q1_17_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_3,
p18_3 / ((1.0e+0)+(1.0e+0)*p18_3) - p18_2 / ((1.0e+0)+(1.0e+0)*p18_2) - 0.75*q18_19_3 + 0.75*q17_18_3 - 0.25*q18_19_2 + 0.25*q17_18_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_3,
p19_3 / ((1.0e+0)+(1.0e+0)*p19_3) - p19_2 / ((1.0e+0)+(1.0e+0)*p19_2) - f19_20_3 + 0.75*q18_19_3 + 0.25*q18_19_2 == 0
  )
  @NLconstraint(nlp, m20_3,
p20_3 / ((1.0e+0)+(1.0e+0)*p20_3) - p20_2 / ((1.0e+0)+(1.0e+0)*p20_2) - 0.75*q20_21_3 + f19_20_3 - 0.25*q20_21_2 == 0
  )
  @NLconstraint(nlp, m21_3,
p21_3 / ((1.0e+0)+(1.0e+0)*p21_3) - p21_2 / ((1.0e+0)+(1.0e+0)*p21_2) - 0.75*q21_22_3 + 0.75*q20_21_3 - 0.25*q21_22_2 + 0.25*q20_21_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_3,
p22_3 / ((1.0e+0)+(1.0e+0)*p22_3) - p22_2 / ((1.0e+0)+(1.0e+0)*p22_2) - 0.75*q22_23_3 + 0.75*q21_22_3 - 0.25*q22_23_2 + 0.25*q21_22_2 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_3,
p23_3 / ((1.0e+0)+(1.0e+0)*p23_3) - p23_2 / ((1.0e+0)+(1.0e+0)*p23_2) + 0.75*q22_23_3 + 0.25*q22_23_2 - out23_3 == 0
  )
  @NLconstraint(nlp, c3_4_3,
p3_3 * r3_4_3 - p4_3 == 0
  )
  @NLconstraint(nlp, c5_7_3,
p5_3 * r5_7_3 - p7_3 == 0
  )
  @NLconstraint(nlp, c19_20_3,
p19_3 * r19_20_3 - p20_3 == 0
  )
  @NLconstraint(nlp, p1_2_3,
p1_3 * p1_3 - p2_3 * p2_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_3+p2_3)) * ((abs(q1_2_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_3,
p1_3 * p1_3 - p17_3 * p17_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_3+p17_3)) * ((abs(q1_17_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_3,
p2_3 * p2_3 - p3_3 * p3_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_3+p3_3)) * ((abs(q2_3_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_3,
p4_3 * p4_3 - p5_3 * p5_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_3+p5_3)) * ((abs(q4_5_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_3,
p5_3 * p5_3 - p6_3 * p6_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_3+p6_3)) * ((abs(q5_6_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_3,
p7_3 * p7_3 - p8_3 * p8_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_3+p8_3)) * ((abs(q7_8_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_3,
p8_3 * p8_3 - p9_3 * p9_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_3+p9_3)) * ((abs(q8_9_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_3,
p8_3 * p8_3 - p10_3 * p10_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_3+p10_3)) * ((abs(q8_10_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_3,
p8_3 * p8_3 - p11_3 * p11_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_3+p11_3)) * ((abs(q8_11_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_3,
p11_3 * p11_3 - p12_3 * p12_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_3+p12_3)) * ((abs(q11_12_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_3,
p12_3 * p12_3 - p13_3 * p13_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_3+p13_3)) * ((abs(q12_13_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_3,
p13_3 * p13_3 - p14_3 * p14_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_3+p14_3)) * ((abs(q13_14_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_3,
p13_3 * p13_3 - p15_3 * p15_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_3+p15_3)) * ((abs(q13_15_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_3,
p15_3 * p15_3 - p16_3 * p16_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_3+p16_3)) * ((abs(q15_16_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_3,
p17_3 * p17_3 - p18_3 * p18_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_3+p18_3)) * ((abs(q17_18_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_3,
p18_3 * p18_3 - p19_3 * p19_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_3+p19_3)) * ((abs(q18_19_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_3,
p20_3 * p20_3 - p21_3 * p21_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_3+p21_3)) * ((abs(q20_21_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_3,
p21_3 * p21_3 - p22_3 * p22_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_3+p22_3)) * ((abs(q21_22_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_3,
p22_3 * p22_3 - p23_3 * p23_3 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_3+p23_3)) * ((abs(q22_23_3))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, m1_4,
p1_4 / ((1.0e+0)+(1.0e+0)*p1_4) - p1_3 / ((1.0e+0)+(1.0e+0)*p1_3) - 0.75*q1_17_4 - 0.75*q1_2_4 + in1_4 - 0.25*q1_17_3 - 0.25*q1_2_3 == 0
  )
  @NLconstraint(nlp, m2_4,
p2_4 / ((1.0e+0)+(1.0e+0)*p2_4) - p2_3 / ((1.0e+0)+(1.0e+0)*p2_3) - 0.75*q2_3_4 + 0.75*q1_2_4 - 0.25*q2_3_3 + 0.25*q1_2_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_4,
p3_4 / ((1.0e+0)+(1.0e+0)*p3_4) - p3_3 / ((1.0e+0)+(1.0e+0)*p3_3) - f3_4_4 + 0.75*q2_3_4 + 0.25*q2_3_3 == 0
  )
  @NLconstraint(nlp, m4_4,
p4_4 / ((1.0e+0)+(1.0e+0)*p4_4) - p4_3 / ((1.0e+0)+(1.0e+0)*p4_3) - 0.75*q4_5_4 + f3_4_4 - 0.25*q4_5_3 == 0
  )
  @NLconstraint(nlp, m5_4,
p5_4 / ((1.0e+0)+(1.0e+0)*p5_4) - p5_3 / ((1.0e+0)+(1.0e+0)*p5_3) - 0.75*q5_6_4 - f5_7_4 + 0.75*q4_5_4 - 0.25*q5_6_3 + 0.25*q4_5_3 == 0
  )
  @NLconstraint(nlp, m6_4,
p6_4 / ((1.0e+0)+(1.0e+0)*p6_4) - p6_3 / ((1.0e+0)+(1.0e+0)*p6_3) + 0.75*q5_6_4 + 0.25*q5_6_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_4,
p7_4 / ((1.0e+0)+(1.0e+0)*p7_4) - p7_3 / ((1.0e+0)+(1.0e+0)*p7_3) - 0.75*q7_8_4 + f5_7_4 - 0.25*q7_8_3 == 0
  )
  @NLconstraint(nlp, m8_4,
p8_4 / ((1.0e+0)+(1.0e+0)*p8_4) - p8_3 / ((1.0e+0)+(1.0e+0)*p8_3) - 0.75*q8_9_4 - 0.75*q8_10_4 - 0.75*q8_11_4 + 0.75*q7_8_4 - 0.25*q8_9_3 - 0.25*q8_10_3 - 0.25*q8_11_3 + 0.25*q7_8_3 == 0
  )
  @NLconstraint(nlp, m9_4,
p9_4 / ((1.0e+0)+(1.0e+0)*p9_4) - p9_3 / ((1.0e+0)+(1.0e+0)*p9_3) + 0.75*q8_9_4 + 0.25*q8_9_3 == 0
  )
  @NLconstraint(nlp, m10_4,
p10_4 / ((1.0e+0)+(1.0e+0)*p10_4) - p10_3 / ((1.0e+0)+(1.0e+0)*p10_3) + 0.75*q8_10_4 + 0.25*q8_10_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_4,
p11_4 / ((1.0e+0)+(1.0e+0)*p11_4) - p11_3 / ((1.0e+0)+(1.0e+0)*p11_3) - 0.75*q11_12_4 + 0.75*q8_11_4 - 0.25*q11_12_3 + 0.25*q8_11_3 == 0
  )
  @NLconstraint(nlp, m12_4,
p12_4 / ((1.0e+0)+(1.0e+0)*p12_4) - p12_3 / ((1.0e+0)+(1.0e+0)*p12_3) - 0.75*q12_13_4 + 0.75*q11_12_4 - 0.25*q12_13_3 + 0.25*q11_12_3 == 0
  )
  @NLconstraint(nlp, m13_4,
p13_4 / ((1.0e+0)+(1.0e+0)*p13_4) - p13_3 / ((1.0e+0)+(1.0e+0)*p13_3) - 0.75*q13_14_4 - 0.75*q13_15_4 + 0.75*q12_13_4 - 0.25*q13_14_3 - 0.25*q13_15_3 + 0.25*q12_13_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_4,
p14_4 / ((1.0e+0)+(1.0e+0)*p14_4) - p14_3 / ((1.0e+0)+(1.0e+0)*p14_3) + 0.75*q13_14_4 + 0.25*q13_14_3 == 0
  )
  @NLconstraint(nlp, m15_4,
p15_4 / ((1.0e+0)+(1.0e+0)*p15_4) - p15_3 / ((1.0e+0)+(1.0e+0)*p15_3) - 0.75*q15_16_4 + 0.75*q13_15_4 - 0.25*q15_16_3 + 0.25*q13_15_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_4,
p16_4 / ((1.0e+0)+(1.0e+0)*p16_4) - p16_3 / ((1.0e+0)+(1.0e+0)*p16_3) + 0.75*q15_16_4 + 0.25*q15_16_3 - out16_4 == 0
  )
  @NLconstraint(nlp, m17_4,
p17_4 / ((1.0e+0)+(1.0e+0)*p17_4) - p17_3 / ((1.0e+0)+(1.0e+0)*p17_3) - 0.75*q17_18_4 + 0.75*q1_17_4 - 0.25*q17_18_3 + 0.25*q1_17_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_4,
p18_4 / ((1.0e+0)+(1.0e+0)*p18_4) - p18_3 / ((1.0e+0)+(1.0e+0)*p18_3) - 0.75*q18_19_4 + 0.75*q17_18_4 - 0.25*q18_19_3 + 0.25*q17_18_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_4,
p19_4 / ((1.0e+0)+(1.0e+0)*p19_4) - p19_3 / ((1.0e+0)+(1.0e+0)*p19_3) - f19_20_4 + 0.75*q18_19_4 + 0.25*q18_19_3 == 0
  )
  @NLconstraint(nlp, m20_4,
p20_4 / ((1.0e+0)+(1.0e+0)*p20_4) - p20_3 / ((1.0e+0)+(1.0e+0)*p20_3) - 0.75*q20_21_4 + f19_20_4 - 0.25*q20_21_3 == 0
  )
  @NLconstraint(nlp, m21_4,
p21_4 / ((1.0e+0)+(1.0e+0)*p21_4) - p21_3 / ((1.0e+0)+(1.0e+0)*p21_3) - 0.75*q21_22_4 + 0.75*q20_21_4 - 0.25*q21_22_3 + 0.25*q20_21_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_4,
p22_4 / ((1.0e+0)+(1.0e+0)*p22_4) - p22_3 / ((1.0e+0)+(1.0e+0)*p22_3) - 0.75*q22_23_4 + 0.75*q21_22_4 - 0.25*q22_23_3 + 0.25*q21_22_3 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_4,
p23_4 / ((1.0e+0)+(1.0e+0)*p23_4) - p23_3 / ((1.0e+0)+(1.0e+0)*p23_3) + 0.75*q22_23_4 + 0.25*q22_23_3 - out23_4 == 0
  )
  @NLconstraint(nlp, c3_4_4,
p3_4 * r3_4_4 - p4_4 == 0
  )
  @NLconstraint(nlp, c5_7_4,
p5_4 * r5_7_4 - p7_4 == 0
  )
  @NLconstraint(nlp, c19_20_4,
p19_4 * r19_20_4 - p20_4 == 0
  )
  @NLconstraint(nlp, p1_2_4,
p1_4 * p1_4 - p2_4 * p2_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_4+p2_4)) * ((abs(q1_2_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_4,
p1_4 * p1_4 - p17_4 * p17_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_4+p17_4)) * ((abs(q1_17_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_4,
p2_4 * p2_4 - p3_4 * p3_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_4+p3_4)) * ((abs(q2_3_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_4,
p4_4 * p4_4 - p5_4 * p5_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_4+p5_4)) * ((abs(q4_5_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_4,
p5_4 * p5_4 - p6_4 * p6_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_4+p6_4)) * ((abs(q5_6_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_4,
p7_4 * p7_4 - p8_4 * p8_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_4+p8_4)) * ((abs(q7_8_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_4,
p8_4 * p8_4 - p9_4 * p9_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_4+p9_4)) * ((abs(q8_9_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_4,
p8_4 * p8_4 - p10_4 * p10_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_4+p10_4)) * ((abs(q8_10_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_4,
p8_4 * p8_4 - p11_4 * p11_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_4+p11_4)) * ((abs(q8_11_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_4,
p11_4 * p11_4 - p12_4 * p12_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_4+p12_4)) * ((abs(q11_12_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_4,
p12_4 * p12_4 - p13_4 * p13_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_4+p13_4)) * ((abs(q12_13_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_4,
p13_4 * p13_4 - p14_4 * p14_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_4+p14_4)) * ((abs(q13_14_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_4,
p13_4 * p13_4 - p15_4 * p15_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_4+p15_4)) * ((abs(q13_15_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_4,
p15_4 * p15_4 - p16_4 * p16_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_4+p16_4)) * ((abs(q15_16_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_4,
p17_4 * p17_4 - p18_4 * p18_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_4+p18_4)) * ((abs(q17_18_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_4,
p18_4 * p18_4 - p19_4 * p19_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_4+p19_4)) * ((abs(q18_19_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_4,
p20_4 * p20_4 - p21_4 * p21_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_4+p21_4)) * ((abs(q20_21_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_4,
p21_4 * p21_4 - p22_4 * p22_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_4+p22_4)) * ((abs(q21_22_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_4,
p22_4 * p22_4 - p23_4 * p23_4 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_4+p23_4)) * ((abs(q22_23_4))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, m1_5,
p1_5 / ((1.0e+0)+(1.0e+0)*p1_5) - p1_4 / ((1.0e+0)+(1.0e+0)*p1_4) - 0.75*q1_17_5 - 0.75*q1_2_5 + in1_5 - 0.25*q1_17_4 - 0.25*q1_2_4 == 0
  )
  @NLconstraint(nlp, m2_5,
p2_5 / ((1.0e+0)+(1.0e+0)*p2_5) - p2_4 / ((1.0e+0)+(1.0e+0)*p2_4) - 0.75*q2_3_5 + 0.75*q1_2_5 - 0.25*q2_3_4 + 0.25*q1_2_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_5,
p3_5 / ((1.0e+0)+(1.0e+0)*p3_5) - p3_4 / ((1.0e+0)+(1.0e+0)*p3_4) - f3_4_5 + 0.75*q2_3_5 + 0.25*q2_3_4 == 0
  )
  @NLconstraint(nlp, m4_5,
p4_5 / ((1.0e+0)+(1.0e+0)*p4_5) - p4_4 / ((1.0e+0)+(1.0e+0)*p4_4) - 0.75*q4_5_5 + f3_4_5 - 0.25*q4_5_4 == 0
  )
  @NLconstraint(nlp, m5_5,
p5_5 / ((1.0e+0)+(1.0e+0)*p5_5) - p5_4 / ((1.0e+0)+(1.0e+0)*p5_4) - 0.75*q5_6_5 - f5_7_5 + 0.75*q4_5_5 - 0.25*q5_6_4 + 0.25*q4_5_4 == 0
  )
  @NLconstraint(nlp, m6_5,
p6_5 / ((1.0e+0)+(1.0e+0)*p6_5) - p6_4 / ((1.0e+0)+(1.0e+0)*p6_4) + 0.75*q5_6_5 + 0.25*q5_6_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_5,
p7_5 / ((1.0e+0)+(1.0e+0)*p7_5) - p7_4 / ((1.0e+0)+(1.0e+0)*p7_4) - 0.75*q7_8_5 + f5_7_5 - 0.25*q7_8_4 == 0
  )
  @NLconstraint(nlp, m8_5,
p8_5 / ((1.0e+0)+(1.0e+0)*p8_5) - p8_4 / ((1.0e+0)+(1.0e+0)*p8_4) - 0.75*q8_9_5 - 0.75*q8_10_5 - 0.75*q8_11_5 + 0.75*q7_8_5 - 0.25*q8_9_4 - 0.25*q8_10_4 - 0.25*q8_11_4 + 0.25*q7_8_4 == 0
  )
  @NLconstraint(nlp, m9_5,
p9_5 / ((1.0e+0)+(1.0e+0)*p9_5) - p9_4 / ((1.0e+0)+(1.0e+0)*p9_4) + 0.75*q8_9_5 + 0.25*q8_9_4 == 0
  )
  @NLconstraint(nlp, m10_5,
p10_5 / ((1.0e+0)+(1.0e+0)*p10_5) - p10_4 / ((1.0e+0)+(1.0e+0)*p10_4) + 0.75*q8_10_5 + 0.25*q8_10_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_5,
p11_5 / ((1.0e+0)+(1.0e+0)*p11_5) - p11_4 / ((1.0e+0)+(1.0e+0)*p11_4) - 0.75*q11_12_5 + 0.75*q8_11_5 - 0.25*q11_12_4 + 0.25*q8_11_4 == 0
  )
  @NLconstraint(nlp, m12_5,
p12_5 / ((1.0e+0)+(1.0e+0)*p12_5) - p12_4 / ((1.0e+0)+(1.0e+0)*p12_4) - 0.75*q12_13_5 + 0.75*q11_12_5 - 0.25*q12_13_4 + 0.25*q11_12_4 == 0
  )
  @NLconstraint(nlp, m13_5,
p13_5 / ((1.0e+0)+(1.0e+0)*p13_5) - p13_4 / ((1.0e+0)+(1.0e+0)*p13_4) - 0.75*q13_14_5 - 0.75*q13_15_5 + 0.75*q12_13_5 - 0.25*q13_14_4 - 0.25*q13_15_4 + 0.25*q12_13_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_5,
p14_5 / ((1.0e+0)+(1.0e+0)*p14_5) - p14_4 / ((1.0e+0)+(1.0e+0)*p14_4) + 0.75*q13_14_5 + 0.25*q13_14_4 == 0
  )
  @NLconstraint(nlp, m15_5,
p15_5 / ((1.0e+0)+(1.0e+0)*p15_5) - p15_4 / ((1.0e+0)+(1.0e+0)*p15_4) - 0.75*q15_16_5 + 0.75*q13_15_5 - 0.25*q15_16_4 + 0.25*q13_15_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_5,
p16_5 / ((1.0e+0)+(1.0e+0)*p16_5) - p16_4 / ((1.0e+0)+(1.0e+0)*p16_4) + 0.75*q15_16_5 + 0.25*q15_16_4 - out16_5 == 0
  )
  @NLconstraint(nlp, m17_5,
p17_5 / ((1.0e+0)+(1.0e+0)*p17_5) - p17_4 / ((1.0e+0)+(1.0e+0)*p17_4) - 0.75*q17_18_5 + 0.75*q1_17_5 - 0.25*q17_18_4 + 0.25*q1_17_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_5,
p18_5 / ((1.0e+0)+(1.0e+0)*p18_5) - p18_4 / ((1.0e+0)+(1.0e+0)*p18_4) - 0.75*q18_19_5 + 0.75*q17_18_5 - 0.25*q18_19_4 + 0.25*q17_18_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_5,
p19_5 / ((1.0e+0)+(1.0e+0)*p19_5) - p19_4 / ((1.0e+0)+(1.0e+0)*p19_4) - f19_20_5 + 0.75*q18_19_5 + 0.25*q18_19_4 == 0
  )
  @NLconstraint(nlp, m20_5,
p20_5 / ((1.0e+0)+(1.0e+0)*p20_5) - p20_4 / ((1.0e+0)+(1.0e+0)*p20_4) - 0.75*q20_21_5 + f19_20_5 - 0.25*q20_21_4 == 0
  )
  @NLconstraint(nlp, m21_5,
p21_5 / ((1.0e+0)+(1.0e+0)*p21_5) - p21_4 / ((1.0e+0)+(1.0e+0)*p21_4) - 0.75*q21_22_5 + 0.75*q20_21_5 - 0.25*q21_22_4 + 0.25*q20_21_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_5,
p22_5 / ((1.0e+0)+(1.0e+0)*p22_5) - p22_4 / ((1.0e+0)+(1.0e+0)*p22_4) - 0.75*q22_23_5 + 0.75*q21_22_5 - 0.25*q22_23_4 + 0.25*q21_22_4 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_5,
p23_5 / ((1.0e+0)+(1.0e+0)*p23_5) - p23_4 / ((1.0e+0)+(1.0e+0)*p23_4) + 0.75*q22_23_5 + 0.25*q22_23_4 - out23_5 == 0
  )
  @NLconstraint(nlp, c3_4_5,
p3_5 * r3_4_5 - p4_5 == 0
  )
  @NLconstraint(nlp, c5_7_5,
p5_5 * r5_7_5 - p7_5 == 0
  )
  @NLconstraint(nlp, c19_20_5,
p19_5 * r19_20_5 - p20_5 == 0
  )
  @NLconstraint(nlp, p1_2_5,
p1_5 * p1_5 - p2_5 * p2_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_5+p2_5)) * ((abs(q1_2_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_5,
p1_5 * p1_5 - p17_5 * p17_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_5+p17_5)) * ((abs(q1_17_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_5,
p2_5 * p2_5 - p3_5 * p3_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_5+p3_5)) * ((abs(q2_3_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_5,
p4_5 * p4_5 - p5_5 * p5_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_5+p5_5)) * ((abs(q4_5_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_5,
p5_5 * p5_5 - p6_5 * p6_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_5+p6_5)) * ((abs(q5_6_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_5,
p7_5 * p7_5 - p8_5 * p8_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_5+p8_5)) * ((abs(q7_8_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_5,
p8_5 * p8_5 - p9_5 * p9_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_5+p9_5)) * ((abs(q8_9_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_5,
p8_5 * p8_5 - p10_5 * p10_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_5+p10_5)) * ((abs(q8_10_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_5,
p8_5 * p8_5 - p11_5 * p11_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_5+p11_5)) * ((abs(q8_11_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_5,
p11_5 * p11_5 - p12_5 * p12_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_5+p12_5)) * ((abs(q11_12_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_5,
p12_5 * p12_5 - p13_5 * p13_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_5+p13_5)) * ((abs(q12_13_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_5,
p13_5 * p13_5 - p14_5 * p14_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_5+p14_5)) * ((abs(q13_14_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_5,
p13_5 * p13_5 - p15_5 * p15_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_5+p15_5)) * ((abs(q13_15_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_5,
p15_5 * p15_5 - p16_5 * p16_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_5+p16_5)) * ((abs(q15_16_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_5,
p17_5 * p17_5 - p18_5 * p18_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_5+p18_5)) * ((abs(q17_18_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_5,
p18_5 * p18_5 - p19_5 * p19_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_5+p19_5)) * ((abs(q18_19_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_5,
p20_5 * p20_5 - p21_5 * p21_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_5+p21_5)) * ((abs(q20_21_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_5,
p21_5 * p21_5 - p22_5 * p22_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_5+p22_5)) * ((abs(q21_22_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_5,
p22_5 * p22_5 - p23_5 * p23_5 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_5+p23_5)) * ((abs(q22_23_5))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, m1_6,
p1_6 / ((1.0e+0)+(1.0e+0)*p1_6) - p1_5 / ((1.0e+0)+(1.0e+0)*p1_5) - 0.75*q1_17_6 - 0.75*q1_2_6 + in1_6 - 0.25*q1_17_5 - 0.25*q1_2_5 == 0
  )
  @NLconstraint(nlp, m2_6,
p2_6 / ((1.0e+0)+(1.0e+0)*p2_6) - p2_5 / ((1.0e+0)+(1.0e+0)*p2_5) - 0.75*q2_3_6 + 0.75*q1_2_6 - 0.25*q2_3_5 + 0.25*q1_2_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_6,
p3_6 / ((1.0e+0)+(1.0e+0)*p3_6) - p3_5 / ((1.0e+0)+(1.0e+0)*p3_5) - f3_4_6 + 0.75*q2_3_6 + 0.25*q2_3_5 == 0
  )
  @NLconstraint(nlp, m4_6,
p4_6 / ((1.0e+0)+(1.0e+0)*p4_6) - p4_5 / ((1.0e+0)+(1.0e+0)*p4_5) - 0.75*q4_5_6 + f3_4_6 - 0.25*q4_5_5 == 0
  )
  @NLconstraint(nlp, m5_6,
p5_6 / ((1.0e+0)+(1.0e+0)*p5_6) - p5_5 / ((1.0e+0)+(1.0e+0)*p5_5) - 0.75*q5_6_6 - f5_7_6 + 0.75*q4_5_6 - 0.25*q5_6_5 + 0.25*q4_5_5 == 0
  )
  @NLconstraint(nlp, m6_6,
p6_6 / ((1.0e+0)+(1.0e+0)*p6_6) - p6_5 / ((1.0e+0)+(1.0e+0)*p6_5) + 0.75*q5_6_6 + 0.25*q5_6_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_6,
p7_6 / ((1.0e+0)+(1.0e+0)*p7_6) - p7_5 / ((1.0e+0)+(1.0e+0)*p7_5) - 0.75*q7_8_6 + f5_7_6 - 0.25*q7_8_5 == 0
  )
  @NLconstraint(nlp, m8_6,
p8_6 / ((1.0e+0)+(1.0e+0)*p8_6) - p8_5 / ((1.0e+0)+(1.0e+0)*p8_5) - 0.75*q8_9_6 - 0.75*q8_10_6 - 0.75*q8_11_6 + 0.75*q7_8_6 - 0.25*q8_9_5 - 0.25*q8_10_5 - 0.25*q8_11_5 + 0.25*q7_8_5 == 0
  )
  @NLconstraint(nlp, m9_6,
p9_6 / ((1.0e+0)+(1.0e+0)*p9_6) - p9_5 / ((1.0e+0)+(1.0e+0)*p9_5) + 0.75*q8_9_6 + 0.25*q8_9_5 == 0
  )
  @NLconstraint(nlp, m10_6,
p10_6 / ((1.0e+0)+(1.0e+0)*p10_6) - p10_5 / ((1.0e+0)+(1.0e+0)*p10_5) + 0.75*q8_10_6 + 0.25*q8_10_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_6,
p11_6 / ((1.0e+0)+(1.0e+0)*p11_6) - p11_5 / ((1.0e+0)+(1.0e+0)*p11_5) - 0.75*q11_12_6 + 0.75*q8_11_6 - 0.25*q11_12_5 + 0.25*q8_11_5 == 0
  )
  @NLconstraint(nlp, m12_6,
p12_6 / ((1.0e+0)+(1.0e+0)*p12_6) - p12_5 / ((1.0e+0)+(1.0e+0)*p12_5) - 0.75*q12_13_6 + 0.75*q11_12_6 - 0.25*q12_13_5 + 0.25*q11_12_5 == 0
  )
  @NLconstraint(nlp, m13_6,
p13_6 / ((1.0e+0)+(1.0e+0)*p13_6) - p13_5 / ((1.0e+0)+(1.0e+0)*p13_5) - 0.75*q13_14_6 - 0.75*q13_15_6 + 0.75*q12_13_6 - 0.25*q13_14_5 - 0.25*q13_15_5 + 0.25*q12_13_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_6,
p14_6 / ((1.0e+0)+(1.0e+0)*p14_6) - p14_5 / ((1.0e+0)+(1.0e+0)*p14_5) + 0.75*q13_14_6 + 0.25*q13_14_5 == 0
  )
  @NLconstraint(nlp, m15_6,
p15_6 / ((1.0e+0)+(1.0e+0)*p15_6) - p15_5 / ((1.0e+0)+(1.0e+0)*p15_5) - 0.75*q15_16_6 + 0.75*q13_15_6 - 0.25*q15_16_5 + 0.25*q13_15_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_6,
p16_6 / ((1.0e+0)+(1.0e+0)*p16_6) - p16_5 / ((1.0e+0)+(1.0e+0)*p16_5) + 0.75*q15_16_6 + 0.25*q15_16_5 - out16_6 == 0
  )
  @NLconstraint(nlp, m17_6,
p17_6 / ((1.0e+0)+(1.0e+0)*p17_6) - p17_5 / ((1.0e+0)+(1.0e+0)*p17_5) - 0.75*q17_18_6 + 0.75*q1_17_6 - 0.25*q17_18_5 + 0.25*q1_17_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_6,
p18_6 / ((1.0e+0)+(1.0e+0)*p18_6) - p18_5 / ((1.0e+0)+(1.0e+0)*p18_5) - 0.75*q18_19_6 + 0.75*q17_18_6 - 0.25*q18_19_5 + 0.25*q17_18_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_6,
p19_6 / ((1.0e+0)+(1.0e+0)*p19_6) - p19_5 / ((1.0e+0)+(1.0e+0)*p19_5) - f19_20_6 + 0.75*q18_19_6 + 0.25*q18_19_5 == 0
  )
  @NLconstraint(nlp, m20_6,
p20_6 / ((1.0e+0)+(1.0e+0)*p20_6) - p20_5 / ((1.0e+0)+(1.0e+0)*p20_5) - 0.75*q20_21_6 + f19_20_6 - 0.25*q20_21_5 == 0
  )
  @NLconstraint(nlp, m21_6,
p21_6 / ((1.0e+0)+(1.0e+0)*p21_6) - p21_5 / ((1.0e+0)+(1.0e+0)*p21_5) - 0.75*q21_22_6 + 0.75*q20_21_6 - 0.25*q21_22_5 + 0.25*q20_21_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_6,
p22_6 / ((1.0e+0)+(1.0e+0)*p22_6) - p22_5 / ((1.0e+0)+(1.0e+0)*p22_5) - 0.75*q22_23_6 + 0.75*q21_22_6 - 0.25*q22_23_5 + 0.25*q21_22_5 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_6,
p23_6 / ((1.0e+0)+(1.0e+0)*p23_6) - p23_5 / ((1.0e+0)+(1.0e+0)*p23_5) + 0.75*q22_23_6 + 0.25*q22_23_5 - out23_6 == 0
  )
  @NLconstraint(nlp, c3_4_6,
p3_6 * r3_4_6 - p4_6 == 0
  )
  @NLconstraint(nlp, c5_7_6,
p5_6 * r5_7_6 - p7_6 == 0
  )
  @NLconstraint(nlp, c19_20_6,
p19_6 * r19_20_6 - p20_6 == 0
  )
  @NLconstraint(nlp, p1_2_6,
p1_6 * p1_6 - p2_6 * p2_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_6+p2_6)) * ((abs(q1_2_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_6,
p1_6 * p1_6 - p17_6 * p17_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_6+p17_6)) * ((abs(q1_17_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_6,
p2_6 * p2_6 - p3_6 * p3_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_6+p3_6)) * ((abs(q2_3_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_6,
p4_6 * p4_6 - p5_6 * p5_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_6+p5_6)) * ((abs(q4_5_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_6,
p5_6 * p5_6 - p6_6 * p6_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_6+p6_6)) * ((abs(q5_6_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_6,
p7_6 * p7_6 - p8_6 * p8_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_6+p8_6)) * ((abs(q7_8_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_6,
p8_6 * p8_6 - p9_6 * p9_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_6+p9_6)) * ((abs(q8_9_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_6,
p8_6 * p8_6 - p10_6 * p10_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_6+p10_6)) * ((abs(q8_10_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_6,
p8_6 * p8_6 - p11_6 * p11_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_6+p11_6)) * ((abs(q8_11_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_6,
p11_6 * p11_6 - p12_6 * p12_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_6+p12_6)) * ((abs(q11_12_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_6,
p12_6 * p12_6 - p13_6 * p13_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_6+p13_6)) * ((abs(q12_13_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_6,
p13_6 * p13_6 - p14_6 * p14_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_6+p14_6)) * ((abs(q13_14_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_6,
p13_6 * p13_6 - p15_6 * p15_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_6+p15_6)) * ((abs(q13_15_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_6,
p15_6 * p15_6 - p16_6 * p16_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_6+p16_6)) * ((abs(q15_16_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_6,
p17_6 * p17_6 - p18_6 * p18_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_6+p18_6)) * ((abs(q17_18_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_6,
p18_6 * p18_6 - p19_6 * p19_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_6+p19_6)) * ((abs(q18_19_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_6,
p20_6 * p20_6 - p21_6 * p21_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_6+p21_6)) * ((abs(q20_21_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_6,
p21_6 * p21_6 - p22_6 * p22_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_6+p22_6)) * ((abs(q21_22_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_6,
p22_6 * p22_6 - p23_6 * p23_6 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_6+p23_6)) * ((abs(q22_23_6))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, m1_7,
p1_7 / ((1.0e+0)+(1.0e+0)*p1_7) - p1_6 / ((1.0e+0)+(1.0e+0)*p1_6) - 0.75*q1_17_7 - 0.75*q1_2_7 + in1_7 - 0.25*q1_17_6 - 0.25*q1_2_6 == 0
  )
  @NLconstraint(nlp, m2_7,
p2_7 / ((1.0e+0)+(1.0e+0)*p2_7) - p2_6 / ((1.0e+0)+(1.0e+0)*p2_6) - 0.75*q2_3_7 + 0.75*q1_2_7 - 0.25*q2_3_6 + 0.25*q1_2_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_7,
p3_7 / ((1.0e+0)+(1.0e+0)*p3_7) - p3_6 / ((1.0e+0)+(1.0e+0)*p3_6) - f3_4_7 + 0.75*q2_3_7 + 0.25*q2_3_6 == 0
  )
  @NLconstraint(nlp, m4_7,
p4_7 / ((1.0e+0)+(1.0e+0)*p4_7) - p4_6 / ((1.0e+0)+(1.0e+0)*p4_6) - 0.75*q4_5_7 + f3_4_7 - 0.25*q4_5_6 == 0
  )
  @NLconstraint(nlp, m5_7,
p5_7 / ((1.0e+0)+(1.0e+0)*p5_7) - p5_6 / ((1.0e+0)+(1.0e+0)*p5_6) - 0.75*q5_6_7 - f5_7_7 + 0.75*q4_5_7 - 0.25*q5_6_6 + 0.25*q4_5_6 == 0
  )
  @NLconstraint(nlp, m6_7,
p6_7 / ((1.0e+0)+(1.0e+0)*p6_7) - p6_6 / ((1.0e+0)+(1.0e+0)*p6_6) + 0.75*q5_6_7 + 0.25*q5_6_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_7,
p7_7 / ((1.0e+0)+(1.0e+0)*p7_7) - p7_6 / ((1.0e+0)+(1.0e+0)*p7_6) - 0.75*q7_8_7 + f5_7_7 - 0.25*q7_8_6 == 0
  )
  @NLconstraint(nlp, m8_7,
p8_7 / ((1.0e+0)+(1.0e+0)*p8_7) - p8_6 / ((1.0e+0)+(1.0e+0)*p8_6) - 0.75*q8_9_7 - 0.75*q8_10_7 - 0.75*q8_11_7 + 0.75*q7_8_7 - 0.25*q8_9_6 - 0.25*q8_10_6 - 0.25*q8_11_6 + 0.25*q7_8_6 == 0
  )
  @NLconstraint(nlp, m9_7,
p9_7 / ((1.0e+0)+(1.0e+0)*p9_7) - p9_6 / ((1.0e+0)+(1.0e+0)*p9_6) + 0.75*q8_9_7 + 0.25*q8_9_6 == 0
  )
  @NLconstraint(nlp, m10_7,
p10_7 / ((1.0e+0)+(1.0e+0)*p10_7) - p10_6 / ((1.0e+0)+(1.0e+0)*p10_6) + 0.75*q8_10_7 + 0.25*q8_10_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_7,
p11_7 / ((1.0e+0)+(1.0e+0)*p11_7) - p11_6 / ((1.0e+0)+(1.0e+0)*p11_6) - 0.75*q11_12_7 + 0.75*q8_11_7 - 0.25*q11_12_6 + 0.25*q8_11_6 == 0
  )
  @NLconstraint(nlp, m12_7,
p12_7 / ((1.0e+0)+(1.0e+0)*p12_7) - p12_6 / ((1.0e+0)+(1.0e+0)*p12_6) - 0.75*q12_13_7 + 0.75*q11_12_7 - 0.25*q12_13_6 + 0.25*q11_12_6 == 0
  )
  @NLconstraint(nlp, m13_7,
p13_7 / ((1.0e+0)+(1.0e+0)*p13_7) - p13_6 / ((1.0e+0)+(1.0e+0)*p13_6) - 0.75*q13_14_7 - 0.75*q13_15_7 + 0.75*q12_13_7 - 0.25*q13_14_6 - 0.25*q13_15_6 + 0.25*q12_13_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_7,
p14_7 / ((1.0e+0)+(1.0e+0)*p14_7) - p14_6 / ((1.0e+0)+(1.0e+0)*p14_6) + 0.75*q13_14_7 + 0.25*q13_14_6 == 0
  )
  @NLconstraint(nlp, m15_7,
p15_7 / ((1.0e+0)+(1.0e+0)*p15_7) - p15_6 / ((1.0e+0)+(1.0e+0)*p15_6) - 0.75*q15_16_7 + 0.75*q13_15_7 - 0.25*q15_16_6 + 0.25*q13_15_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_7,
p16_7 / ((1.0e+0)+(1.0e+0)*p16_7) - p16_6 / ((1.0e+0)+(1.0e+0)*p16_6) + 0.75*q15_16_7 + 0.25*q15_16_6 - out16_7 == 0
  )
  @NLconstraint(nlp, m17_7,
p17_7 / ((1.0e+0)+(1.0e+0)*p17_7) - p17_6 / ((1.0e+0)+(1.0e+0)*p17_6) - 0.75*q17_18_7 + 0.75*q1_17_7 - 0.25*q17_18_6 + 0.25*q1_17_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_7,
p18_7 / ((1.0e+0)+(1.0e+0)*p18_7) - p18_6 / ((1.0e+0)+(1.0e+0)*p18_6) - 0.75*q18_19_7 + 0.75*q17_18_7 - 0.25*q18_19_6 + 0.25*q17_18_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_7,
p19_7 / ((1.0e+0)+(1.0e+0)*p19_7) - p19_6 / ((1.0e+0)+(1.0e+0)*p19_6) - f19_20_7 + 0.75*q18_19_7 + 0.25*q18_19_6 == 0
  )
  @NLconstraint(nlp, m20_7,
p20_7 / ((1.0e+0)+(1.0e+0)*p20_7) - p20_6 / ((1.0e+0)+(1.0e+0)*p20_6) - 0.75*q20_21_7 + f19_20_7 - 0.25*q20_21_6 == 0
  )
  @NLconstraint(nlp, m21_7,
p21_7 / ((1.0e+0)+(1.0e+0)*p21_7) - p21_6 / ((1.0e+0)+(1.0e+0)*p21_6) - 0.75*q21_22_7 + 0.75*q20_21_7 - 0.25*q21_22_6 + 0.25*q20_21_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_7,
p22_7 / ((1.0e+0)+(1.0e+0)*p22_7) - p22_6 / ((1.0e+0)+(1.0e+0)*p22_6) - 0.75*q22_23_7 + 0.75*q21_22_7 - 0.25*q22_23_6 + 0.25*q21_22_6 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_7,
p23_7 / ((1.0e+0)+(1.0e+0)*p23_7) - p23_6 / ((1.0e+0)+(1.0e+0)*p23_6) + 0.75*q22_23_7 + 0.25*q22_23_6 - out23_7 == 0
  )
  @NLconstraint(nlp, c3_4_7,
p3_7 * r3_4_7 - p4_7 == 0
  )
  @NLconstraint(nlp, c5_7_7,
p5_7 * r5_7_7 - p7_7 == 0
  )
  @NLconstraint(nlp, c19_20_7,
p19_7 * r19_20_7 - p20_7 == 0
  )
  @NLconstraint(nlp, p1_2_7,
p1_7 * p1_7 - p2_7 * p2_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_7+p2_7)) * ((abs(q1_2_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_7,
p1_7 * p1_7 - p17_7 * p17_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_7+p17_7)) * ((abs(q1_17_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_7,
p2_7 * p2_7 - p3_7 * p3_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_7+p3_7)) * ((abs(q2_3_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_7,
p4_7 * p4_7 - p5_7 * p5_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_7+p5_7)) * ((abs(q4_5_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_7,
p5_7 * p5_7 - p6_7 * p6_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_7+p6_7)) * ((abs(q5_6_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_7,
p7_7 * p7_7 - p8_7 * p8_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_7+p8_7)) * ((abs(q7_8_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_7,
p8_7 * p8_7 - p9_7 * p9_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_7+p9_7)) * ((abs(q8_9_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_7,
p8_7 * p8_7 - p10_7 * p10_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_7+p10_7)) * ((abs(q8_10_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_7,
p8_7 * p8_7 - p11_7 * p11_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_7+p11_7)) * ((abs(q8_11_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_7,
p11_7 * p11_7 - p12_7 * p12_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_7+p12_7)) * ((abs(q11_12_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_7,
p12_7 * p12_7 - p13_7 * p13_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_7+p13_7)) * ((abs(q12_13_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_7,
p13_7 * p13_7 - p14_7 * p14_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_7+p14_7)) * ((abs(q13_14_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_7,
p13_7 * p13_7 - p15_7 * p15_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_7+p15_7)) * ((abs(q13_15_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_7,
p15_7 * p15_7 - p16_7 * p16_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_7+p16_7)) * ((abs(q15_16_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_7,
p17_7 * p17_7 - p18_7 * p18_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_7+p18_7)) * ((abs(q17_18_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_7,
p18_7 * p18_7 - p19_7 * p19_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_7+p19_7)) * ((abs(q18_19_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_7,
p20_7 * p20_7 - p21_7 * p21_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_7+p21_7)) * ((abs(q20_21_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_7,
p21_7 * p21_7 - p22_7 * p22_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_7+p22_7)) * ((abs(q21_22_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_7,
p22_7 * p22_7 - p23_7 * p23_7 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_7+p23_7)) * ((abs(q22_23_7))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, m1_8,
p1_8 / ((1.0e+0)+(1.0e+0)*p1_8) - p1_7 / ((1.0e+0)+(1.0e+0)*p1_7) - 0.75*q1_17_8 - 0.75*q1_2_8 + in1_8 - 0.25*q1_17_7 - 0.25*q1_2_7 == 0
  )
  @NLconstraint(nlp, m2_8,
p2_8 / ((1.0e+0)+(1.0e+0)*p2_8) - p2_7 / ((1.0e+0)+(1.0e+0)*p2_7) - 0.75*q2_3_8 + 0.75*q1_2_8 - 0.25*q2_3_7 + 0.25*q1_2_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m3_8,
p3_8 / ((1.0e+0)+(1.0e+0)*p3_8) - p3_7 / ((1.0e+0)+(1.0e+0)*p3_7) - f3_4_8 + 0.75*q2_3_8 + 0.25*q2_3_7 == 0
  )
  @NLconstraint(nlp, m4_8,
p4_8 / ((1.0e+0)+(1.0e+0)*p4_8) - p4_7 / ((1.0e+0)+(1.0e+0)*p4_7) - 0.75*q4_5_8 + f3_4_8 - 0.25*q4_5_7 == 0
  )
  @NLconstraint(nlp, m5_8,
p5_8 / ((1.0e+0)+(1.0e+0)*p5_8) - p5_7 / ((1.0e+0)+(1.0e+0)*p5_7) - 0.75*q5_6_8 - f5_7_8 + 0.75*q4_5_8 - 0.25*q5_6_7 + 0.25*q4_5_7 == 0
  )
  @NLconstraint(nlp, m6_8,
p6_8 / ((1.0e+0)+(1.0e+0)*p6_8) - p6_7 / ((1.0e+0)+(1.0e+0)*p6_7) + 0.75*q5_6_8 + 0.25*q5_6_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m7_8,
p7_8 / ((1.0e+0)+(1.0e+0)*p7_8) - p7_7 / ((1.0e+0)+(1.0e+0)*p7_7) - 0.75*q7_8_8 + f5_7_8 - 0.25*q7_8_7 == 0
  )
  @NLconstraint(nlp, m8_8,
p8_8 / ((1.0e+0)+(1.0e+0)*p8_8) - p8_7 / ((1.0e+0)+(1.0e+0)*p8_7) - 0.75*q8_9_8 - 0.75*q8_10_8 - 0.75*q8_11_8 + 0.75*q7_8_8 - 0.25*q8_9_7 - 0.25*q8_10_7 - 0.25*q8_11_7 + 0.25*q7_8_7 == 0
  )
  @NLconstraint(nlp, m9_8,
p9_8 / ((1.0e+0)+(1.0e+0)*p9_8) - p9_7 / ((1.0e+0)+(1.0e+0)*p9_7) + 0.75*q8_9_8 + 0.25*q8_9_7 == 0
  )
  @NLconstraint(nlp, m10_8,
p10_8 / ((1.0e+0)+(1.0e+0)*p10_8) - p10_7 / ((1.0e+0)+(1.0e+0)*p10_7) + 0.75*q8_10_8 + 0.25*q8_10_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m11_8,
p11_8 / ((1.0e+0)+(1.0e+0)*p11_8) - p11_7 / ((1.0e+0)+(1.0e+0)*p11_7) - 0.75*q11_12_8 + 0.75*q8_11_8 - 0.25*q11_12_7 + 0.25*q8_11_7 == 0
  )
  @NLconstraint(nlp, m12_8,
p12_8 / ((1.0e+0)+(1.0e+0)*p12_8) - p12_7 / ((1.0e+0)+(1.0e+0)*p12_7) - 0.75*q12_13_8 + 0.75*q11_12_8 - 0.25*q12_13_7 + 0.25*q11_12_7 == 0
  )
  @NLconstraint(nlp, m13_8,
p13_8 / ((1.0e+0)+(1.0e+0)*p13_8) - p13_7 / ((1.0e+0)+(1.0e+0)*p13_7) - 0.75*q13_14_8 - 0.75*q13_15_8 + 0.75*q12_13_8 - 0.25*q13_14_7 - 0.25*q13_15_7 + 0.25*q12_13_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m14_8,
p14_8 / ((1.0e+0)+(1.0e+0)*p14_8) - p14_7 / ((1.0e+0)+(1.0e+0)*p14_7) + 0.75*q13_14_8 + 0.25*q13_14_7 == 0
  )
  @NLconstraint(nlp, m15_8,
p15_8 / ((1.0e+0)+(1.0e+0)*p15_8) - p15_7 / ((1.0e+0)+(1.0e+0)*p15_7) - 0.75*q15_16_8 + 0.75*q13_15_8 - 0.25*q15_16_7 + 0.25*q13_15_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m16_8,
p16_8 / ((1.0e+0)+(1.0e+0)*p16_8) - p16_7 / ((1.0e+0)+(1.0e+0)*p16_7) + 0.75*q15_16_8 + 0.25*q15_16_7 - out16_8 == 0
  )
  @NLconstraint(nlp, m17_8,
p17_8 / ((1.0e+0)+(1.0e+0)*p17_8) - p17_7 / ((1.0e+0)+(1.0e+0)*p17_7) - 0.75*q17_18_8 + 0.75*q1_17_8 - 0.25*q17_18_7 + 0.25*q1_17_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m18_8,
p18_8 / ((1.0e+0)+(1.0e+0)*p18_8) - p18_7 / ((1.0e+0)+(1.0e+0)*p18_7) - 0.75*q18_19_8 + 0.75*q17_18_8 - 0.25*q18_19_7 + 0.25*q17_18_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m19_8,
p19_8 / ((1.0e+0)+(1.0e+0)*p19_8) - p19_7 / ((1.0e+0)+(1.0e+0)*p19_7) - f19_20_8 + 0.75*q18_19_8 + 0.25*q18_19_7 == 0
  )
  @NLconstraint(nlp, m20_8,
p20_8 / ((1.0e+0)+(1.0e+0)*p20_8) - p20_7 / ((1.0e+0)+(1.0e+0)*p20_7) - 0.75*q20_21_8 + f19_20_8 - 0.25*q20_21_7 == 0
  )
  @NLconstraint(nlp, m21_8,
p21_8 / ((1.0e+0)+(1.0e+0)*p21_8) - p21_7 / ((1.0e+0)+(1.0e+0)*p21_7) - 0.75*q21_22_8 + 0.75*q20_21_8 - 0.25*q21_22_7 + 0.25*q20_21_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m22_8,
p22_8 / ((1.0e+0)+(1.0e+0)*p22_8) - p22_7 / ((1.0e+0)+(1.0e+0)*p22_7) - 0.75*q22_23_8 + 0.75*q21_22_8 - 0.25*q22_23_7 + 0.25*q21_22_7 - 1.0 == 0
  )
  @NLconstraint(nlp, m23_8,
p23_8 / ((1.0e+0)+(1.0e+0)*p23_8) - p23_7 / ((1.0e+0)+(1.0e+0)*p23_7) + 0.75*q22_23_8 + 0.25*q22_23_7 - out23_8 == 0
  )
  @NLconstraint(nlp, c3_4_8,
p3_8 * r3_4_8 - p4_8 == 0
  )
  @NLconstraint(nlp, c5_7_8,
p5_8 * r5_7_8 - p7_8 == 0
  )
  @NLconstraint(nlp, c19_20_8,
p19_8 * r19_20_8 - p20_8 == 0
  )
  @NLconstraint(nlp, p1_2_8,
p1_8 * p1_8 - p2_8 * p2_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_8+p2_8)) * ((abs(q1_2_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p1_17_8,
p1_8 * p1_8 - p17_8 * p17_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p1_8+p17_8)) * ((abs(q1_17_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p2_3_8,
p2_8 * p2_8 - p3_8 * p3_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p2_8+p3_8)) * ((abs(q2_3_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p4_5_8,
p4_8 * p4_8 - p5_8 * p5_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p4_8+p5_8)) * ((abs(q4_5_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p5_6_8,
p5_8 * p5_8 - p6_8 * p6_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p5_8+p6_8)) * ((abs(q5_6_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p7_8_8,
p7_8 * p7_8 - p8_8 * p8_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p7_8+p8_8)) * ((abs(q7_8_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_9_8,
p8_8 * p8_8 - p9_8 * p9_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_8+p9_8)) * ((abs(q8_9_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_10_8,
p8_8 * p8_8 - p10_8 * p10_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_8+p10_8)) * ((abs(q8_10_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p8_11_8,
p8_8 * p8_8 - p11_8 * p11_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p8_8+p11_8)) * ((abs(q8_11_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p11_12_8,
p11_8 * p11_8 - p12_8 * p12_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p11_8+p12_8)) * ((abs(q11_12_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p12_13_8,
p12_8 * p12_8 - p13_8 * p13_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p12_8+p13_8)) * ((abs(q12_13_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_14_8,
p13_8 * p13_8 - p14_8 * p14_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_8+p14_8)) * ((abs(q13_14_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p13_15_8,
p13_8 * p13_8 - p15_8 * p15_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p13_8+p15_8)) * ((abs(q13_15_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p15_16_8,
p15_8 * p15_8 - p16_8 * p16_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p15_8+p16_8)) * ((abs(q15_16_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p17_18_8,
p17_8 * p17_8 - p18_8 * p18_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p17_8+p18_8)) * ((abs(q17_18_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p18_19_8,
p18_8 * p18_8 - p19_8 * p19_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p18_8+p19_8)) * ((abs(q18_19_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p20_21_8,
p20_8 * p20_8 - p21_8 * p21_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p20_8+p21_8)) * ((abs(q20_21_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p21_22_8,
p21_8 * p21_8 - p22_8 * p22_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p21_8+p22_8)) * ((abs(q21_22_8))^1.8539e+0) == 0
  )
  @NLconstraint(nlp, p22_23_8,
p22_8 * p22_8 - p23_8 * p23_8 - 0.01*((1.0e+0)+(5.0e-1*1.0e+0)*(p22_8+p23_8)) * ((abs(q22_23_8))^1.8539e+0) == 0
  )

  return nlp
end

