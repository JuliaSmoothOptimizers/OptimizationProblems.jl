export avion2

function avion2(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}


  function f(x)
    SR, LR, PK, EF, SX, LX, SD, SK, ST, SF, LF, AM, CA, CB, SO, SS, IMPDER, IMPK, IMPFUS, QI, PT, MV, MC, MD, PD, NS, VS, CR, PM, DV, MZ, VN, QV, QF, IMPTRAIN, IMPMOT, IMPNMOT, IMPPET, IMPPIL, IMPCAN, IMPSNA, MS, EL, DE, DS, IMPVOIL, NM, NP, NG = x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10], x[11], x[12], x[13], x[14], x[15], x[16], x[17], x[18], x[19], x[20], x[21], x[22], x[23], x[24], x[25], x[26], x[27], x[28], x[29], x[30], x[31], x[32], x[33], x[34], x[35], x[36], x[37], x[38], x[39], x[40], x[41], x[42], x[43], x[44], x[45], x[46], x[47], x[48], x[49]
    return     (SK - T(0.01)*PK*SR)^2
    + (CA - (SS-SO-CB*LF)/(LF^2) )^2
    + (-2*AM+SO+SS + T(0.01)*EF/LF)^2
    + (AM - T(0.025)*SO*CB^2/CA)^2
    + (IMPDER - T(27.5)*SD - T(1.3)*SD^2)^2
    + (IMPK - 70*SK + T(8.6)*SK^2)^2
    + (QI - 1000 + MV^2/24000)^2
    + (1000*PT - MD*PD)^2
    + (VN + VS +QF/790 + 2 - MZ/CR +DV*PT)^2
    + (IMPMOT - 1000*PT/(PM+20) - 12*sqrt(PT))^2
    + (ST - T(1.25)*SR*NM)^2
    + (SR - MD/MS)^2
    + (QV - T(2.4)*SX*sqrt(SX)*EL/sqrt(LX))^2
    + (SO - T(0.785)*DE^2*PT)^2
    + (SS - T(0.785)*DS^2*PT)^2
    + (CB - 2*(VN-CA*LF^3)/(LF^2*(3-SO*LF)))^2
    + (IMPVOIL - T(1.15)*SX*(15+T(0.15)*SX)*(8+(MC*LX/(50*SR*EL))^1.5))^2
    
  end
  x0 = T[
    2.7452e+01,
    1.5000e+00,
    1.0000e+01,
    0.0000e+00,
    1.9217e+01,
    1.5000e+00,
    3.5688e+00,
    4.0696e+00,
    3.4315e+01,
    8.8025e+01,
    5.1306e+00,
    0.0000e+00,
    -1.4809e-01,
    7.5980e-01,
    0.0000e+00,
    0.0000e+00,
    1.1470e+02,
    5.0000e+02,
    1.7605e+03,
    2.3256e+03,
    5.6788e+00,
    1.4197e+04,
    1.2589e+04,
    2.8394e+04,
    2.0000e-01,
    1.0000e+00,
    0.0000e+00,
    1.0000e+02,
    1.5000e+01,
    0.0000e+00,
    5.0000e+02,
    1.0000e+01,
    8.1490e+02,
    3.1405e+03,
    1.9450e+03,
    1.9085e+02,
    3.5000e+01,
    1.0000e+02,
    2.0000e+02,
    1.2000e+02,
    7.0000e+02,
    1.0000e+03,
    4.9367e+00,
    0.0000e+00,
    0.0000e+00,
    5.0000e+03,
    1,
    1,
    1,
  ]
  function c(x)
    SR, LR, PK, EF, SX, LX, SD, SK, ST, SF, LF, AM, CA, CB, SO, SS, IMPDER, IMPK, IMPFUS, QI, PT, MV, MC, MD, PD, NS, VS, CR, PM, DV, MZ, VN, QV, QF, IMPTRAIN, IMPMOT, IMPNMOT, IMPPET, IMPPIL, IMPCAN, IMPSNA, MS, EL, DE, DS, IMPVOIL, NM, NP, NG = x[1], x[2], x[3], x[4], x[5], x[6], x[7], x[8], x[9], x[10], x[11], x[12], x[13], x[14], x[15], x[16], x[17], x[18], x[19], x[20], x[21], x[22], x[23], x[24], x[25], x[26], x[27], x[28], x[29], x[30], x[31], x[32], x[33], x[34], x[35], x[36], x[37], x[38], x[39], x[40], x[41], x[42], x[43], x[44], x[45], x[46], x[47], x[48], x[49]
    return   [
    SD-T(0.13)*SR ,
    SX-T(0.7)*SR ,
    LX-LR ,
    SF - ST - 2*SD - 2*SX - 2*SK ,
    IMPFUS - 20*SF ,
    MD - 2*MV ,
    QF - QI - QV ,
    IMPTRAIN - T(0.137)*MV ,
    IMPNMOT - 35*NM ,
    IMPPET - T(0.043)*QI ,
    IMPPIL - 200*NP ,
    IMPCAN - 120*NG ,
    IMPSNA - 300*NS - 400,
    MC - MV + 95*NP + 70*NG + 660*NM + T(0.5)*QI - 380,
    MZ - IMPTRAIN + IMPNMOT + IMPPET + IMPPIL + IMPCAN + IMPSNA+ 290,
  ]
  end
  lcon = zeros(T, 15)
  ucon = zeros(T, 15)
  lvar = T[
    10,
    0,
    0,
    0,
    7,
    1.5,
    2,
    2,
    30,
    20,
    0.01,
    0,
    -0.2,
    0.1,
    0,
    0,
    100,
    500,
    500,
    1000,
    2,
    2000,
    3000,
    5000,
    0.2,
    1,
    0,
    100,
    4,
    0,
    500,
    10,
    250,
    750,
    250,
    10,
    35,
    100,
    200,
    120,
    700,
    100,
    2,
    0,
    0,
    500,
    1,
    1,
    1,
  ]
  uvar = T[
    150,
    10,
    10,
    5,
    120,
    8,
    20,
    30,
    500,
    200,
    20,
    10,
    -0.001,
    2,
    1,
    2,
    1000,
    5000,
    5000,
    20000,
    30,
    20000,
    30000,
    50000,
    0.8,
    5,
    20,
    400,
    15,
    10,
    10000,
    50,
    5000,
    15000,
    3000,
    5000,
    70,
    3000,
    400,
    240,
    1900,
    1000,
    20,
    1,
    2,
    5000,
    2,
    2,
    2,
  ]

  return ADNLPModels.ADNLPModel(f, x0, lvar, uvar, c, lcon, ucon, name = "avion2"; kwargs...)
end

