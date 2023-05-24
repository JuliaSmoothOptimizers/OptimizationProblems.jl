# OptimizationProblems.jl

```@example ex1
using OptimizationProblems, Plots
```

## The Julia Test Set of Optimization Problems

This package provides a collection of optimization problems in
[JuMP](https://github.com/JuliaOpt/JuMP.jl) and [ADNLPModels](https://github.com/JuliaSmoothOptimizers/ADNLPModels.jl) syntax.

All the metadata are accessible without loading the problems.

```@example ex1
meta = OptimizationProblems.meta;
```

```@example ex1
fixed_meta = meta[.!meta.variable_nvar .& .!meta.variable_ncon, :]
nvars = fixed_meta[!, :nvar]
nvars_small = min.(nvars, 110)
b_range = range(0, 110, length=10)
p = histogram(nvars_small, label="Number of variables", bins=b_range) # , normalize=:pdf, color=:gray

findall(x -> x > 10, nvars) # only 19 problems
findall(x -> x < 5, nvars) # 294 problems !
```

```@example ex1
scalable_meta = meta[meta.variable_nvar .| meta.variable_ncon, :] # 94
```
scalable_unconstrained_meta = meta[(meta.variable_nvar .| meta.variable_ncon) .& (meta.ncon .== 0), :] # 81
scalable_constrained_meta = meta[(meta.variable_nvar .| meta.variable_ncon) .& (meta.ncon .> 0), :] # 13

```@example ex1
using PlotlyJS

PlotlyJS.plot(
    table(
        header_values=[
            "# of scalable problems",
            "# of unconstrained scalable problems",
            "# of constrained scalable problems",
        ],
        cells_values=[
            [length(meta[meta.variable_nvar .| meta.variable_ncon, :name])],
            [length(meta[(meta.variable_nvar .| meta.variable_ncon) .& (meta.ncon .== 0), :name])],
            [length(meta[(meta.variable_nvar .| meta.variable_ncon) .& (meta.ncon .> 0), :name])],
        ]
    )
)
```

## Implemented problems

- [ ] COPS 3.0. https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues/161 (8 / 22) 
- [ ] MGH https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues/115 ( 34 / 35 )
- [ ] Hock-Schittkowski https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues/113 ( 108 / 115 )

- [ ] Schittkowski revisited https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues/114 ( 1 / 188 )
- [ ] Sparse test problems for unconstrained optimization. https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues/116 (4 / 96)

- [X] NIST https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl/issues/141 ( 27 / 27 )
- [X] Modified CUTE Problems for Sparse Unconstrained Optimization ( 58 / 58 )

TODO:
- [ ] 175 problems 
Jamil, Momin, and Xin-She Yang. "A literature survey of benchmark functions for global optimisation problems." International Journal of Mathematical Modelling and Numerical Optimisation 4.2 (2013): 150-194. https://arxiv.org/pdf/1308.4008.pdf
-> some are available in R in https://journal.r-project.org/articles/RJ-2017-004/RJ-2017-004.pdf
- [ ] Handbook of Test Problems in Local and Global Optimization by C. Floudas et al. / https://arnold-neumaier.at/glopt/contrib/handbook_corr.html
- [ ] MINPACK-2 https://www.mcs.anl.gov/~more/tprobs/
- [ ] Klaus Schittkowski data fitting problems http://klaus-schittkowski.de/ds_test_problems.pdf

## Alternative packages

- OPM: a small collection of CUTEst unconstrained and bound-constrained nonlinear optimization problems, which can be used in Matlab for testing optimization algorithms directly (i.e. without installing additional software). 
- CUTEst: CUTEst.jl

## References

- NIST http://www.itl.nist.gov/div898/strd/nls/nls_main.shtml

- Hock, Willi, and Klaus Schittkowski. "Test examples for nonlinear programming codes." Journal of optimization theory and applications 30 (1980): 127-129. https://link.springer.com/book/10.1007/978-3-642-48320-2
- Moré, Jorge J., Burton S. Garbow, and Kenneth E. Hillstrom. "Testing unconstrained optimization software." ACM Transactions on Mathematical Software (TOMS) 7.1 (1981): 17-41. https://dl.acm.org/doi/pdf/10.1145/355934.355936
- Dolan, Elizabeth D., Jorge J. Moré, and Todd S. Munson. Benchmarking optimization software with COPS 3.0. No. ANL/MCS-TM-273. Argonne National Lab., Argonne, IL (US), 2004. https://www.mcs.anl.gov/~more//cops/cops3.pdf
- Lukšan, Ladislav, Ctirad Matonoha, and Jan Vlcek. "Sparse test problems for unconstrained optimization." Techical Report 1064 (2010). http://www.cs.cas.cz/matonoha/download/V1064.pdf
- Lukšan, Ladislav, Ctirad Matonoha, and Jan Vlcek. "Modified CUTE problems for sparse unconstrained optimization." Techical Report 1081 (2010). http://www.cs.cas.cz/matonoha/download/V1081.pdf
- Schittkowski, Klaus. More test examples for nonlinear programming codes. Vol. 282. Springer Science & Business Media, 2012. https://link.springer.com/book/10.1007/978-3-642-61582-5
- Gould, Nicholas IM, Dominique Orban, and Philippe L. Toint. "CUTEr and SifDec: A constrained and unconstrained testing environment, revisited." ACM Transactions on Mathematical Software (TOMS) 29.4 (2003): 373-394. https://www.cuter.rl.ac.uk/Problems/mastsif.shtml
- Gould, Nicholas IM, Dominique Orban, and Philippe L. Toint. "CUTEst: a constrained and unconstrained testing environment with safe threads for mathematical optimization." Computational optimization and applications 60 (2015): 545-557.
- Gratton, Serge, and Philippe L. Toint. "OPM, a collection of Optimization Problems in Matlab." arXiv preprint arXiv:2112.05636 (2021).  https://arxiv.org/abs/2112.05636

- AMPL-NLP Benchmark http://plato.asu.edu/ftp/ampl-nlp.html 

Review: https://arnold-neumaier.at/glopt/test.html
