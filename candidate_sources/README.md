# Candidate sources

This folder tracks external sources that may contain optimization problems to add to `OptimizationProblems.jl`.

Candidate sources can include:

- papers;
- benchmark collections;
- books;
- technical reports;
- web pages;
- code repositories;
- PDFs describing test sets.

PDFs and large raw source files are not committed to the repository.

Each source folder should contain links, bibliographic information, ingestion notes, candidate problem lists, and duplicate-risk reports.

## Workflow

1. Create a source subfolder.
2. Add a `README.md` with source information and a link to the PDF or source.
3. Download the PDF locally as `source.pdf`.
4. Create an ingestion report.
5. Create `candidate_problems.yml`.
6. Run duplicate checks.
7. Select a first implementation batch.
8. Implement problems in separate PRs.

## File policy

Committed files:

- `README.md`
- `ingestion_report.md`
- `candidate_problems.yml`
- `duplicate_risk_report.md`
- `notes.md`

Not committed:

- PDFs;
- downloaded archives;
- large raw data files, unless explicitly approved.
