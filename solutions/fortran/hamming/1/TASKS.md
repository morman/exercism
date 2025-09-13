# Project Improvement Tasks (Fortran Hamming)

Below is a prioritized, actionable list to improve this Exercism Fortran Hamming project. Each item is small and practical for incremental PRs.

## P0 — Correctness and API
- Make `compute` a pure function: declare `pure` and specify `intent(in)` for inputs and `intent(out)` for `distance`. Ensure no side effects. 
- Clarify API contract in code comments: document that unequal-length inputs return `.false.` and leave `distance=0`.
- Add parameter validation: explicitly guard against non-ACGT letters (optional per Exercism, but document either way).

## P1 — Code Quality and Style
- Add `implicit none` and explicit `intent` for all procedures and variables (already partially done; complete it and enforce in tests too).
- Use named `kind` for integers/characters to be explicit about sizes (e.g., `integer, parameter :: IK = selected_int_kind(9)`).
- Prefer `len_trim` or validate trailing blanks behavior; add tests for trailing spaces if deemed relevant.
- Refactor loop to use local `n = len(strand1)` once; minor clarity/perf.
- Add module-level documentation block describing purpose and usage.

## P2 — Tests
- Add negative/edge-case tests:
  - Mixed-case inputs (decide and document whether to allow or normalize).
  - Inputs with spaces or newline characters.
  - Very long equal-length strands performance/sanity test.
- Add property-style checks (e.g., distance of identical strings is zero; symmetry of distance). 
- Ensure tests verify `distance` remains zero when function returns `.false.`.

## P3 — Tooling and Build
- Add a .gitignore: ignore build artifacts (e.g., `build/`, `*.o`, `*.mod`, executables). Currently `hamming.mod` appears committed; remove it and rely on build.
- Add CMake options: `-Wall -Wextra` equivalent via `CMAKE_Fortran_FLAGS` for common compilers (gfortran/ifort), and enable standards flag (e.g., `-std=f2008` if supported).
- Add a simple Makefile wrapper for convenience (optional) or document CMake usage in README.

## P4 — Documentation
- Update README with:
  - Quickstart build/run steps (CMake commands) and how to run tests.
  - Link to this TASKS.md.
  - Notes on API behavior for unequal-length strands and character set assumptions.
- Add CONTRIBUTING.md outlining how to run tests locally and coding style.
- Add LICENSE file if the repository is meant to be shared publicly.

## P5 — Continuous Integration (optional if within Exercism constraints)
- Add GitHub Actions workflow to build and run tests on Ubuntu with `gfortran`.
- Cache CMake and dependency artifacts for faster CI runs.

## P6 — Portability and Robustness
- Verify behavior on multiple compilers (gfortran, ifort, nvfortran) and adjust flags as needed.
- Ensure source uses only standard-conforming features; add note about required Fortran standard.

## P7 — Maintainability
- Add `MODULE PROCEDURE` interface if expanding to multiple overloads (e.g., array-based or sequence types later).
- Consider exposing a variant `compute_distance(strand1, strand2) result(distance)` that returns `integer` and raises error/returns `-1` on length mismatch (documented alternative API), while keeping current Exercism API for compatibility.

## P8 — Examples and Pedagogy
- Provide example usage snippet in README showing calling pattern and expected outputs.
- Add comments in test cases explaining the intent of each test for learners.

## P9 — Performance (not critical here, but good practice)
- Micro-optimization: early exit if remaining positions cannot change the outcome? (Not necessary; current O(n) is fine.)
- Benchmark script for very long strings to ensure no pathological slowdowns (optional).

---
Ownership and sequencing: Start with P0/P1, then P2/P3, followed by P4. CI and portability can follow once core is solid. Each bullet can be a separate PR with a clear scope.
