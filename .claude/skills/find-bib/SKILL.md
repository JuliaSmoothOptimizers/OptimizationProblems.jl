---
name: find-bib
description: Find or construct a BibTeX reference for an OptimizationProblems.jl meta file. Given a DOI, problem name, or free-form reference text, searches for the DOI online, fetches BibTeX from doi2bib.org, and formats the result as a Julia raw string ready to paste into src/Meta/<name>.jl.
argument-hint: <problem-name | DOI | "free-form reference text">
allowed-tools: [Read, Glob, Grep, WebSearch, WebFetch]
---

# find-bib

Find or construct a BibTeX reference and format it as a Julia raw string for `src/Meta/<name>.jl`.

## Arguments

The user invoked this skill with: $ARGUMENTS

This can be:
- A **problem name** from `src/Meta/` (e.g. `zangwil3`, `hs1`) — skill will read the file and extract context
- A **DOI** (e.g. `10.1145/355934.355936` or `https://doi.org/10.1145/355934.355356`)
- **Free-form reference text** (title, authors, journal, year — quoted or unquoted)
- **Empty** — if no argument is given, ask the user to specify a problem name or reference

---

## Instructions

Follow these steps in order.

### Step 1 — Gather source material

If `$ARGUMENTS` looks like a problem name (no spaces, no slashes, exists as `src/Meta/<name>.jl`):
- Read `src/Meta/$ARGUMENTS.jl`
- Extract `:url`, `:notes`, `:origin_notes`, and the existing `:reference` field (may be empty)
- Use this text as the source for Steps 2–4

Otherwise, treat `$ARGUMENTS` directly as a DOI or free-form reference text.

### Step 2 — Extract or find a DOI

1. Regex-scan all gathered text for a DOI pattern: `10\.\d{4,}/\S+`
   - DOIs appear in `:url`, `:notes`, `:origin_notes`, or in the argument itself
2. If no DOI is found, run a **WebSearch** to locate one:
   - Try: `"<title or key terms>" "<first author>" DOI`
   - Try: `site:doi.org "<title or key terms>"`
   - Try CrossRef: `site:search.crossref.org "<title or key terms>"`
3. Extract the DOI string from any search result that contains one.

### Step 3 — Fetch BibTeX

If a DOI was found (say `10.1145/355934.355936`), try these endpoints in order:

1. **CrossRef** (primary): `https://api.crossref.org/works/10.1145/355934.355936/transform/application/x-bibtex`
2. **doi2bib.org** (fallback): `https://www.doi2bib.org/bib/10.1145/355934.355936`

The response is plain-text BibTeX — clean up whitespace if needed, then apply these normalizations:

- **Citation key**: CrossRef often returns auto-generated keys like `More_1981` or `more1981testingunconstrained`. Always rename the key to the `Author1Author2YYYY` format described in Step 4 (e.g. `MoreGarbowHillstrom1981`).
- **`pages` field**: normalize to BibTeX double-hyphen. Replace Unicode en-dash `–` or a single hyphen `-` between page numbers with `--` (e.g. `175--184`).

If both endpoints fail or return an error, fall through to Step 4.

### Step 4 — Construct BibTeX manually (fallback)

If no DOI was found or doi2bib.org failed, construct the best possible BibTeX from all available information.

Choose the entry type:

| Type | Use when |
|---|---|
| `@article` | journal or conference paper |
| `@book` | book or edited volume |
| `@techreport` | institutional or technical report |
| `@misc` | dataset, software, website, or unclear |

**Citation key format:** `Author1Author2YYYY` using last names only (e.g. `MoreGarbowHillstrom1981`, `HockSchittkowski1981`). For a single author: `AuthorYYYY`. For institutional authors use a compact CamelCase form (e.g. `NISTStRD`).

**`pages` field:** always use double-hyphen: `175--184`. Convert Unicode en-dash `–`, em-dash `—`, or single hyphen `-` between page numbers to `--`.

**LaTeX encoding for special characters:** `Mor{\'e}`, `{\'E}`, etc.

**Flag uncertain fields** with a trailing `% UNVERIFIED` comment on that line.

### Step 5 — Present the result

Show three things:

**1. Status line** — one sentence: whether the DOI was found, and from where.

**2. The BibTeX entry** in a code block:
```bibtex
@article{AuthorYear,
  author  = {Last, First and Last2, First2},
  title   = {Title of the Article},
  journal = {Journal Name},
  year    = {YYYY},
  volume  = {V},
  number  = {N},
  pages   = {P1--P2},
  doi     = {10.xxxx/xxxxx}
}
```

**3. The Julia snippet** ready to paste into `src/Meta/<name>.jl`:
```julia
:reference => raw"""
@article{AuthorYear,
  author  = {Last, First and Last2, First2},
  title   = {Title of the Article},
  journal = {Journal Name},
  year    = {YYYY},
  volume  = {V},
  number  = {N},
  pages   = {P1--P2},
  doi     = {10.xxxx/xxxxx}
}
""",
```

### Step 6 — Suggest next steps

- List any fields marked `% UNVERIFIED` that the user should check manually.
- If a DOI was found and the file's `:url` field does not already contain it, suggest adding `https://doi.org/<DOI>` to `:url`. The `:url` field supports multiple URLs as a **comma-separated string**. If a URL is already present, append the new one: `"https://existing.url, https://doi.org/<DOI>"`.
- If the problem name was given, name the exact file to edit: `src/Meta/<name>.jl`.

---

## BibTeX type templates (reference)

```bibtex
@article{AuthorYear,
  author  = {Last, First},
  title   = {Title},
  journal = {Journal},
  year    = {YYYY},
  volume  = {V},
  number  = {N},
  pages   = {P1--P2},
  doi     = {10.xxxx/xxxxx}
}

@book{AuthorYear,
  author    = {Last, First},
  title     = {Book Title},
  publisher = {Publisher},
  address   = {City},
  year      = {YYYY}
}

@techreport{AuthorYear,
  author      = {Last, First},
  title       = {Report Title},
  institution = {Institution},
  number      = {Report Number},
  year        = {YYYY}
}

@misc{AuthorYear,
  author       = {Last, First},
  title        = {Title},
  year         = {YYYY},
  howpublished = {\url{https://...}}
}
```
