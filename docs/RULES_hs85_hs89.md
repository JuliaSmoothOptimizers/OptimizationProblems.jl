# OptimizationProblems.jl Rules — HS85 & HS89 Example

| Rule | HS85 | HS89 | How to Check |
|------|------|------|--------------|
| File Structure | src/ADNLPProblems/hs85.jl, src/PureJuMP/hs85.jl, src/Meta/hs85.jl | src/ADNLPProblems/hs89.jl, src/PureJuMP/hs89.jl, src/Meta/hs89.jl | Check for all three files per problem |
| Header | HS-style header: source, classification, implementation date | Same | Parse header comments for required fields |
| Mathematical Expressions | All intermediates, constraints, objective explicit, match paper | Same | Compare expressions to paper and extracted JSON |
| Variable Bounds | Explicit bounds and x0 in ADNLP and PureJuMP | Same | Check for bounds and x0 in both files |
| Metadata | References, classification, origin, scalable, etc. in Meta file | Same | Parse Meta file for required metadata |
| Naming | hs85.jl in ADNLPProblems, hs85.jl in PureJuMP, hs85.jl in Meta | hs89.jl in ADNLPProblems, hs89.jl in PureJuMP, hs89.jl in Meta | Check file/function names against repository conventions |
| Allocation | Constraint function minimizes allocations (relaxed for complex) | Same | Run allocation test or allow allocation |
| Ipopt Solve | Problem solves with Ipopt (PureJuMP) | Same | Run Ipopt solver and check for solution |
| Reviewer Markdown | Summary, PDF screenshot, extraction uncertainties, test results | Same | Generate reviewer markdown file |
| Duplication | No duplicate (by name, structure, metadata) | Same | Check for similar names/metadata |
| Traceability | Origin clear and referenced in header/Meta | Same | Check Meta/header |
| Scalability | Marked if scalable (not for hs85/hs89) | Same | Check Meta/implementation |
| Multiple Problems | One PDF = one problem (for hs85/hs89) | Same | Allow multiple if needed |
| Uncertainty | Warn if extraction unclear (not for hs85/hs89) | Same | Parse extraction JSON for uncertainties |

---

This table is tailored to HS85 and HS89. Use as a checklist for similar problems and PRs.
