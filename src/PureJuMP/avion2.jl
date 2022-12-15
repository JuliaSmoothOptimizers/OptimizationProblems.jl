#
# Converted in Julia from https://github.com/mpf/Optimization-Test-Problems
#
# AMPL Model by Hande Y. Benson
#
# Copyright (C) 2001 Princeton University
# All Rights Reserved
#
# PDrmission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby
# granted, provided that the above copyright notice appear in all
# copies and that the copyright notice and this
# permission notice appear in all supporting documentation.
#   classification OLR2-RN-49-15
export avion2

function avion2(; n::Int = default_nvar, kwargs...)
  nlp = Model()


  @variable(nlp, 10 <= SR <= 150, start = 2.7452e+01)
  @variable(nlp, 0 <= LR <= 10, start = 1.5000e+00)
  @variable(nlp, 0 <= PK <= 10, start = 1.0000e+01)
  @variable(nlp, 0 <= EF <= 5, start = 0.0000e+00)
  @variable(nlp, 7 <= SX <= 120, start = 1.9217e+01)
  @variable(nlp, 1.5 <= LX <= 8, start = 1.5000e+00)
  @variable(nlp, 2 <= SD <= 20, start = 3.5688e+00)
  @variable(nlp, 2 <= SK <= 30, start = 4.0696e+00)
  @variable(nlp, 30 <= ST <= 500, start = 3.4315e+01)
  @variable(nlp, 20 <= SF <= 200, start = 8.8025e+01)
  @variable(nlp, 0.01 <= LF <= 20, start = 5.1306e+00)
  @variable(nlp, 0 <= AM <= 10, start = 0.0000e+00)
  @variable(nlp, -0.2 <= CA <= -0.001, start = -1.4809e-01)
  @variable(nlp, 0.1 <= CB <= 2, start = 7.5980e-01)
  @variable(nlp, 0 <= SO <= 1, start = 0.0000e+00)
  @variable(nlp, 0 <= SS <= 2, start = 0.0000e+00)
  @variable(nlp, 100 <= IMPDER <= 1000, start = 1.1470e+02)
  @variable(nlp, 500 <= IMPK <= 5000, start = 5.0000e+02)
  @variable(nlp, 500 <= IMPFUS <= 5000, start = 1.7605e+03)
  @variable(nlp, 1000 <= QI <= 20000, start = 2.3256e+03)
  @variable(nlp, 2 <= PT <= 30, start = 5.6788e+00)
  @variable(nlp, 2000 <= MV <= 20000, start = 1.4197e+04)
  @variable(nlp, 3000 <= MC <= 30000, start = 1.2589e+04)
  @variable(nlp, 5000 <= MD <= 50000, start = 2.8394e+04)
  @variable(nlp, 0.2 <= PD <= 0.8, start = 2.0000e-01)
  @variable(nlp, 1 <= NS <= 5, start = 1.0000e+00)
  @variable(nlp, 0 <= VS <= 20, start = 0.0000e+00)
  @variable(nlp, 100 <= CR <= 400, start = 1.0000e+02)
  @variable(nlp, 4 <= PM <= 15, start = 1.5000e+01)
  @variable(nlp, 0 <= DV <= 10, start = 0.0000e+00)
  @variable(nlp, 500 <= MZ <= 10000, start = 5.0000e+02)
  @variable(nlp, 10 <= VN <= 50, start = 1.0000e+01)
  @variable(nlp, 250 <= QV <= 5000, start = 8.1490e+02)
  @variable(nlp, 750 <= QF <= 15000, start = 3.1405e+03)
  @variable(nlp, 250 <= IMPTRAIN <= 3000, start = 1.9450e+03)
  @variable(nlp, 10 <= IMPMOT <= 5000, start = 1.9085e+02)
  @variable(nlp, 35 <= IMPNMOT <= 70, start = 3.5000e+01)
  @variable(nlp, 100 <= IMPPET <= 3000, start = 1.0000e+02)
  @variable(nlp, 200 <= IMPPIL <= 400, start = 2.0000e+02)
  @variable(nlp, 120 <= IMPCAN <= 240, start = 1.2000e+02)
  @variable(nlp, 700 <= IMPSNA <= 1900, start = 7.0000e+02)
  @variable(nlp, 100 <= MS <= 1000, start = 1.0000e+03)
  @variable(nlp, 2 <= EL <= 20, start = 4.9367e+00)
  @variable(nlp, 0 <= DE <= 1, start = 0.0000e+00)
  @variable(nlp, 0 <= DS <= 2, start = 0.0000e+00)
  @variable(nlp, 500 <= IMPVOIL <= 5000, start = 5.0000e+03)
  @variable(nlp, 1 <= NM <= 2, start = 1)
  @variable(nlp, 1 <= NP <= 2, start = 1)
  @variable(nlp, 1 <= NG <= 2, start = 1)

  @NLobjective(nlp, Min, 
    (SK - 0.01*PK*SR)^2
    + (CA - (SS-SO-CB*LF)/(LF^2) )^2
    + (-2*AM+SO+SS + 0.01*EF/LF)^2
    + (AM - 0.025*SO*CB^2/CA)^2
    + (IMPDER - 27.5*SD - 1.3*SD^2)^2
    + (IMPK - 70*SK + 8.6*SK^2)^2
    + (QI - 1000 + MV^2/24000)^2
    + (1000*PT - MD*PD)^2
    + (VN + VS +QF/790 + 2 - MZ/CR +DV*PT)^2
    + (IMPMOT - 1000*PT/(PM+20) - 12*sqrt(PT))^2
    + (ST - 1.25*SR*NM)^2
    + (SR - MD/MS)^2
    + (QV - 2.4*SX*sqrt(SX)*EL/sqrt(LX))^2
    + (SO - 0.785*DE^2*PT)^2
    + (SS - 0.785*DS^2*PT)^2
    + (CB - 2*(VN-CA*LF^3)/(LF^2*(3-SO*LF)))^2
    + (IMPVOIL - 1.15*SX*(15+0.15*SX)*(8+(MC*LX/(50*SR*EL))^1.5))^2
    
  )
  @NLconstraint(nlp, cons1,
SD-0.13*SR == 0
  )
  @NLconstraint(nlp, cons2,
SX-0.7*SR == 0
  )
  @NLconstraint(nlp, cons3,
LX-LR == 0
  )
  @NLconstraint(nlp, cons5,
SF - ST - 2*SD - 2*SX - 2*SK == 0
  )
  @NLconstraint(nlp, cons11,
IMPFUS - 20*SF == 0
  )
  @NLconstraint(nlp, cons12,
MD - 2*MV == 0
  )
  @NLconstraint(nlp, cons15,
QF - QI - QV == 0
  )
  @NLconstraint(nlp, cons17,
IMPTRAIN - 0.137*MV == 0
  )
  @NLconstraint(nlp, cons19,
IMPNMOT - 35*NM == 0
  )
  @NLconstraint(nlp, cons20,
IMPPET - 0.043*QI == 0
  )
  @NLconstraint(nlp, cons21,
IMPPIL - 200*NP == 0
  )
  @NLconstraint(nlp, cons22,
IMPCAN - 120*NG == 0
  )
  @NLconstraint(nlp, cons23,
IMPSNA - 300*NS -400 == 0
  )
  @NLconstraint(nlp, cons24,
MC - MV + 95*NP + 70*NG + 660*NM + 0.5*QI -380== 0
  )
  @NLconstraint(nlp, cons25,
MZ - IMPTRAIN + IMPNMOT + IMPPET + IMPPIL + IMPCAN + IMPSNA
+ 290==0
  )

  return nlp
end

