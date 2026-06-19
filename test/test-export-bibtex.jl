@testset "export_bibtex: basic output" begin
  bib = tempname() * ".bib"
  export_bibtex(bib)
  @test isfile(bib)
  content = read(bib, String)
  @test !isempty(content)
end

@testset "export_bibtex: deduplication" begin
  bib = tempname() * ".bib"
  export_bibtex(bib)
  content = read(bib, String)
  # arglina cites MoreGarbowHillstrom1981; many MGH problems share this key.
  # Deduplication must ensure it appears exactly once.
  @test count("MoreGarbowHillstrom1981", content) == 1
end

@testset "export_bibtex: include_lib_refs = false omits collection entries" begin
  bib_full = tempname() * ".bib"
  bib_nolibref = tempname() * ".bib"
  export_bibtex(bib_full, include_lib_refs = true)
  export_bibtex(bib_nolibref, include_lib_refs = false)
  @test filesize(bib_nolibref) <= filesize(bib_full)
end
