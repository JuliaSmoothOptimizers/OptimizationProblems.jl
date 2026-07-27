@testset "export_bibtex: basic output" begin
  bib = tempname() * ".bib"
  try
    export_bibtex(bib)
    @test isfile(bib)
    content = read(bib, String)
    @test !isempty(content)
  finally
    rm(bib, force = true)
  end
end

@testset "export_bibtex: deduplication" begin
  bib = tempname() * ".bib"
  try
    export_bibtex(bib)
    content = read(bib, String)
    # arglina and many other MGH problems share MoreGarbowHillstrom1981.
    # Count entry headers (not bare key strings) to avoid false matches
    # inside field values, and verify deduplication keeps exactly one copy.
    @test count("@article{MoreGarbowHillstrom1981", content) == 1
  finally
    rm(bib, force = true)
  end
end

@testset "export_bibtex: include_lib_refs = false omits collection entries" begin
  bib_full = tempname() * ".bib"
  bib_nolibref = tempname() * ".bib"
  try
    export_bibtex(bib_full, include_lib_refs = true)
    export_bibtex(bib_nolibref, include_lib_refs = false)
    # NIST_StRD appears only via lib_refs (not in any per-problem :reference field),
    # so it is a reliable sentinel for whether include_lib_refs was respected.
    @test occursin("NIST_StRD", read(bib_full, String))
    @test !occursin("NIST_StRD", read(bib_nolibref, String))
  finally
    rm(bib_full, force = true)
    rm(bib_nolibref, force = true)
  end
end
