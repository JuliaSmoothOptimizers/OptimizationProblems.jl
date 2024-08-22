ndef = OptimizationProblems.default_nvar
test_nvar = Int(round(ndef / 2))
meta = OptimizationProblems.meta

# Avoid SparseADJacobian/Hessian for too large problem as it requires a lot of memory for CIs
simp_backend = "jacobian_backend = ADNLPModels.ForwardDiffADJacobian, hessian_backend = ADNLPModels.ForwardDiffADHessian"

# list of functions used in unit tests

function meta_sanity_check(prob::Symbol, nlp::AbstractNLPModel)
  meta = OptimizationProblems.eval(Symbol(prob, :_meta))
  getnvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))(n = test_nvar)
  @test getnvar == meta[:nvar] || meta[:variable_nvar]
  getncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))(n = test_nvar)
  @test getncon == meta[:ncon] || meta[:variable_ncon]
  getnlin = OptimizationProblems.eval(Symbol(:get_, prob, :_nlin))(n = test_nvar)
  @test getnlin == nlp.meta.nlin || meta[:variable_ncon]
  getnnln = OptimizationProblems.eval(Symbol(:get_, prob, :_nnln))(n = test_nvar)
  @test getnnln == nlp.meta.nnln || meta[:variable_ncon]
  getnequ = OptimizationProblems.eval(Symbol(:get_, prob, :_nequ))(n = test_nvar)
  @test getnequ == length(get_jfix(nlp)) || meta[:variable_ncon]
  getnineq = OptimizationProblems.eval(Symbol(:get_, prob, :_nineq))(n = test_nvar)
  @test getnineq == (get_ncon(nlp) - length(get_jfix(nlp))) || meta[:variable_ncon]
  @test meta[:best_known_lower_bound] <= meta[:best_known_upper_bound]
  @test meta[:minimize] == get_minimize(nlp)
  @test meta[:has_equalities_only] == (length(get_jfix(nlp)) == get_ncon(nlp) > 0)
  @test meta[:has_inequalities_only] == (get_ncon(nlp) > 0 && length(get_jfix(nlp)) == 0)
  @test meta[:has_bounds] == (length(get_ifree(nlp)) < get_nvar(nlp))
  @test meta[:has_fixed_variables] == (get_ifix(nlp) != [])
end

function test_in_place_constraints(prob::Symbol)
  nlp = OptimizationProblems.ADNLPProblems.eval(prob)()
  return test_in_place_constraints(prob, nlp)
end

function test_in_place_constraints(prob::Symbol, nlp::AbstractNLPModel)
  x = get_x0(nlp)
  ncon = nlp.meta.nnln
  @test ncon > 0
  cx = similar(x, ncon)
  if VERSION ≥ v"1.7"
    @allocated cons_nln!(nlp, x, cx)
    @test (@allocated cons_nln!(nlp, x, cx)) == 0
  end
  m = OptimizationProblems.eval(Meta.parse("get_$(prob)_nnln"))()
  @test ncon == m
end

function test_in_place_residual(prob::Symbol)
  nls = OptimizationProblems.ADNLPProblems.eval(prob)(use_nls = true)
  @test typeof(nls) <: ADNLPModels.ADNLSModel
  return test_in_place_residual(prob, nls)
end

function test_in_place_residual(prob::Symbol, nls::AbstractNLSModel)
  x = nls.meta.x0
  Fx = similar(x, nls.nls_meta.nequ)
  pb = String(prob)
  if VERSION ≥ v"1.7" && !occursin("palmer", pb) && (pb != "watson") # palmer residual allocate
    @allocated residual!(nls, x, Fx)
    @test (@allocated residual!(nls, x, Fx)) == 0
  end
  m = OptimizationProblems.eval(Meta.parse("get_$(prob)_nls_nequ"))()
  @test nls.nls_meta.nequ == m
end

function test_compatibility(prob::Symbol, ndef::Integer = ndef)
  prob_fn = eval(Meta.parse("PureJuMP.$(prob)"))
  model = prob_fn(n = ndef)
  nlp_jump = MathOptNLPModel(model)

  nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
  ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))()

  nlp_ad = if (nvar + ncon < 10000)
    eval(Meta.parse("ADNLPProblems.$(prob)()"))
  else
    # Avoid SparseADJacobian for too large problem as it requires a lot of memory for CIs
    eval(Meta.parse("ADNLPProblems.$(prob)(" * simp_backend * ")"))
  end

  return test_compatibility(prob, nlp_jump, nlp_ad, ndef)
end

function test_compatibility(
  prob::Symbol,
  nlp_jump,
  nlp_ad::ADNLPModels.ADModel,
  ndef::Integer = ndef,
)
  @test nlp_jump.meta.nvar == nlp_ad.meta.nvar
  @test nlp_jump.meta.x0 == nlp_ad.meta.x0
  @test nlp_jump.meta.ncon == nlp_ad.meta.ncon
  @test nlp_jump.meta.lvar == nlp_ad.meta.lvar
  @test nlp_jump.meta.uvar == nlp_ad.meta.uvar

  x1 = nlp_ad.meta.x0
  x2 = nlp_ad.meta.x0 .+ 0.01
  n0 = max(abs(obj(nlp_ad, nlp_ad.meta.x0)), 1)
  obj_tol = 1e-10
  if !(prob in ["brownal", "triangle_pacman", "triangle_deer"]) # precision issue
    if isnan(n0)
      @test isnan(obj(nlp_jump, x1))
    else
      @test isapprox(obj(nlp_ad, x1), obj(nlp_jump, x1), atol = obj_tol * n0)
    end
    n0 = max(abs(obj(nlp_ad, x2)), 1)
    if isnan(n0)
      @test isnan(obj(nlp_jump, x2))
    else
      @test isapprox(obj(nlp_ad, x2), obj(nlp_jump, x2), atol = obj_tol * n0)
    end
  end
  grad(nlp_ad, x1) # just test that it runs

  if nlp_ad.meta.ncon > 0
    cons_tol = 1e-7 #hs100
    @test nlp_ad.meta.lcon == nlp_jump.meta.lcon
    @test nlp_ad.meta.ucon == nlp_jump.meta.ucon
    if !all(isapprox.(cons(nlp_ad, x1), cons(nlp_jump, x1), atol = 1e-10 * n0))
      @info norm(cons(nlp_ad, x1) - cons(nlp_jump, x1), Inf) 1e-10 * n0
    end
    @test all(isapprox.(cons(nlp_ad, x1), cons(nlp_jump, x1), atol = cons_tol * n0))
    if !all(isapprox.(cons(nlp_ad, x2), cons(nlp_jump, x2), atol = 1e-10 * n0))
      @info norm(cons(nlp_ad, x2) - cons(nlp_jump, x2), Inf) 1e-10 * n0
    end
    @test all(isapprox.(cons(nlp_ad, x2), cons(nlp_jump, x2), atol = cons_tol * n0))
    @test nlp_jump.meta.lin == nlp_ad.meta.lin
  end

  meta_sanity_check(prob, nlp_ad)
end

function test_multi_precision(
  prob::Symbol,
  nlp_ad::ADNLPModels.ADNLPModel{T};
  list_types = [Float32, Float64],
) where {T}
  test_multi_precision(T, nlp_ad)
  test_multi_precision(prob, list_types = setdiff(list_types, [T]))
end

function test_multi_precision(prob::Symbol; list_types = [Float32, Float64])
  nvar = OptimizationProblems.eval(Symbol(:get_, prob, :_nvar))()
  ncon = OptimizationProblems.eval(Symbol(:get_, prob, :_ncon))()

  for T in list_types
    nlp = if (nvar + ncon < 10000)
      eval(Meta.parse("ADNLPProblems.$(prob)(type=$(T))"))
    else
      eval(Meta.parse("ADNLPProblems.$(prob)(type=$T, " * simp_backend * ")"))
    end
    test_multi_precision(T, nlp)
  end
end

function test_multi_precision(::Type{T}, nlp::AbstractNLPModel) where {T}
  x0 = get_x0(nlp)
  @test eltype(x0) == T
  @test typeof(obj(nlp, x0)) == T
  if get_ncon(nlp) > 0
    @test eltype(cons(nlp, x0)) == T
  end
end
