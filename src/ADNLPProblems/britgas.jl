export britgas

_britgas_obj(fi, ri) = fi * (abs(ri)^(22 // 100) - 1)

function britgas(; n::Int = default_nvar, type::Type{T} = Float64, kwargs...) where {T}
  hours = T(8)
  nodes = T(23)
  θ = T(0.75)
  a = T(1.0)
  b = T(1.0)
  α = T(1.8539)
  dt = T(1.0)
  one = T(1.0)
  omega = T(1.0) + (-1.0 * T(0.75))
  s = -1 + (T(8))
  crmax = 10
  k = T(1.0)
  zi = T(1.0)
  ktzi = (T(1.0)) * (T(1.0))
  v = T(1.0)
  vddt = (T(1.0)) * ((T(1.0)) / (T(1.0)))
  h = T(0.01)

  # newly introduced

  γ = T(0.5)

  # q variables are indexed with some pairs from 1:23 × 1:23
  q_ind = [
    (1, 2),
    (1, 17),
    (2, 3),
    (4, 5),
    (5, 6),
    (7, 8),
    (8, 9),
    (8, 10),
    (8, 11),
    (11, 12),
    (12, 13),
    (13, 14),
    (13, 15),
    (15, 16),
    (17, 18),
    (18, 19),
    (20, 21),
    (21, 22),
    (22, 23),
  ]

  # f and r variables are indexed with some pairs from 1:23 × 1:23
  fr_ind = [(3, 4), (5, 7), (19, 20)]

  # in and out variables are indexed with some indices from 1:23
  in_ind = [1]
  out_ind = [16, 23]

  # in some constraints we remove one
  ones_ind = [2, 6, 10, 13, 15, 17, 18, 21, 22]

  function f(x)
    f_1 = view(x, 379:381)
    r_1 = view(x, 382:384)
    f_2 = view(x, 385:387)
    r_2 = view(x, 388:390)
    f_3 = view(x, 391:393)
    r_3 = view(x, 394:396)
    f_4 = view(x, 397:399)
    r_4 = view(x, 400:402)
    f_5 = view(x, 403:405)
    r_5 = view(x, 406:408)
    f_6 = view(x, 409:411)
    r_6 = view(x, 412:414)
    f_7 = view(x, 415:417)
    r_7 = view(x, 418:420)
    f_8 = view(x, 421:423)
    r_8 = view(x, 424:426)

    f_ = [f_1, f_2, f_3, f_4, f_5, f_6, f_7, f_8]
    r_ = [r_1, r_2, r_3, r_4, r_5, r_6, r_7, r_8]

    o = sum(mapreduce(_britgas_obj, +, f_[t], r_[t]) for t = 1:8)
    return o
  end
  x0 = ones(T, 450)
  function c!(cx, x)
    p_0 = view(x, 1:23)
    p_1 = view(x, 24:46)
    p_2 = view(x, 47:69)
    p_3 = view(x, 70:92)
    p_4 = view(x, 93:115)
    p_5 = view(x, 116:138)
    p_6 = view(x, 139:161)
    p_7 = view(x, 162:184)
    p_8 = view(x, 185:207)

    q_0 = view(x, 208:226)
    q_1 = view(x, 227:245)
    q_2 = view(x, 246:264)
    q_3 = view(x, 265:283)
    q_4 = view(x, 284:302)
    q_5 = view(x, 303:321)
    q_6 = view(x, 322:340)
    q_7 = view(x, 341:359)
    q_8 = view(x, 360:378)

    f_1 = view(x, 379:381)
    r_1 = view(x, 382:384)
    f_2 = view(x, 385:387)
    r_2 = view(x, 388:390)
    f_3 = view(x, 391:393)
    r_3 = view(x, 394:396)
    f_4 = view(x, 397:399)
    r_4 = view(x, 400:402)
    f_5 = view(x, 403:405)
    r_5 = view(x, 406:408)
    f_6 = view(x, 409:411)
    r_6 = view(x, 412:414)
    f_7 = view(x, 415:417)
    r_7 = view(x, 418:420)
    f_8 = view(x, 421:423)
    r_8 = view(x, 424:426)

    in_1 = view(x, 427:427)
    out_1 = view(x, 428:429)
    in_2 = view(x, 430:430)
    out_2 = view(x, 431:432)
    in_3 = view(x, 433:433)
    out_3 = view(x, 434:435)
    in_4 = view(x, 436:436)
    out_4 = view(x, 437:438)
    in_5 = view(x, 439:439)
    out_5 = view(x, 440:441)
    in_6 = view(x, 442:442)
    out_6 = view(x, 443:444)
    in_7 = view(x, 445:445)
    out_7 = view(x, 446:447)
    in_8 = view(x, 448:448)
    out_8 = view(x, 449:450)

    # multi-step variables
    p = (p_1, p_2, p_3, p_4, p_5, p_6, p_7, p_8)
    q = (q_1, q_2, q_3, q_4, q_5, q_6, q_7, q_8)
    r = (r_1, r_2, r_3, r_4, r_5, r_6, r_7, r_8)
    in_ = (in_1, in_2, in_3, in_4, in_5, in_6, in_7, in_8)
    out_ = (out_1, out_2, out_3, out_4, out_5, out_6, out_7, out_8)

    for t = 1:8
      pt, qt, rt, int, outt = p[t], q[t], r[t], in_[t], out_[t]
      p_prev = t == 1 ? p_0 : p[t - 1]
      q_prev = t == 1 ? q_0 : q[t - 1]

      mt = 1 + (t - 1) * 45

      # 23 constraints
      for i = 1:23
        cx[mt + i] = pt[i] / (1 + pt[i]) - p_prev[i] / (1 + p_prev[i]) - 1
      end
      for (k, (i, j)) in enumerate(q_ind)
        c[mt + i] -= (θ * qt[k] + (1 - θ) * q_prev[k])
        c[mt + j] += (θ * qt[k] + (1 - θ) * q_prev[k])
      end
      for (k, i) in enumerate(in_ind)
        c[mt + i] += int[j]
      end
      for (k, i) in enumerate(out_ind)
        c[mt + i] -= outt[k]
      end
      for (k, i) in enumerate(ones_ind)
        c[mt + i] -= 1
      end

      # 3 constraints
      for (k, (i, j)) in enumerate(fr_ind)
        cx[mt + 24 + k] = pt[i] * rt[k] - pt[j]
      end

      # 19 constraints
      for (k, (i, j)) in enumerate(q_ind)
        cx[mt + 28 + k] = pt[i]^2 - pt[j]^2 - h * (1 + γ * (pt[i] + pt[j])) * (abs(qt[k])^α)
      end
    end

    return cx
  end
  lvar = vcat(  #
    zeros(T, 23 * 9),  # p
    fill(1e-16, 19 * 9),  # q
    repeat(vcat(zeros(T, 3), ones(T, 3)), 8),  # f and r
  )
  uvar = vcat(  #
    fill(typemax(T), 23 * 9),  # p
    fill(typemax(T), 19 * 9),  # q
    repeat(vcat(fill(typemax(T), 3), 10 .* ones(T, 3)), 8)fill(typemax(T), 3 * 8),
  )
  lcon = zeros(T, 360)
  ucon = zeros(T, 360)

  return ADNLPModels.ADNLPModel!(f, x0, lvar, uvar, c!, lcon, ucon, name = "britgas"; kwargs...)
end
