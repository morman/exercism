# Improvement Plan — Fortran Hamming Project

This document analyzes the requirements and proposes a phased improvement plan for the Exercism Fortran Hamming exercise. It complements TASKS.md (action items) with rationale, constraints, success criteria, and a roadmap.

## 1. Context and Current State
- Purpose: Implement Hamming distance calculation and pass the provided test suite.
- Current code: Single module `hamming` with `compute(strand1, strand2, distance) -> logical` that counts differences for equal-length strings and returns `.false.` otherwise. Tests exist and pass for core cases.
- Repo includes: CMake build, local test harness, README with exercise description. A compiled artifact `hamming.mod` is committed.
- Recently added: TASKS.md with prioritized improvements.

## 2. Requirements
### 2.1 Functional Requirements (FR)
- FR1: Provide a function to compute Hamming distance for equal-length DNA strands.
- FR2: Return a failure indicator for unequal-length inputs without modifying out-parameters (distance remains 0).
- FR3: Preserve Exercism API compatibility and existing tests.

### 2.2 Non-Functional Requirements (NFR)
- NFR1: Code quality (explicit intents, `implicit none`, purity where possible).
- NFR2: Test coverage for edge cases (empty strings, single-character, long inputs, mismatch behavior).
- NFR3: Tooling: reproducible builds with warnings enabled; no compiled artifacts committed.
- NFR4: Documentation: clear API behavior and quickstart instructions.
- NFR5: Maintainability and portability across common Fortran compilers.

## 3. Constraints and Assumptions
- Exercism constraints: Must keep exercise approachable; avoid over-engineering or diverging from canonical tests.
- API stability: Keep the `compute` interface as-is for compatibility with the test suite.
- Standard compliance: Prefer Fortran 2008 features that are widely supported by gfortran.
- Repository scope: No external dependencies; simple CMake configuration.

## 4. Stakeholders
- Learners solving the exercise.
- Track maintainers reviewing example implementations.
- CI maintainers (if CI is added) ensuring builds/tests pass.

## 5. Success Criteria and Acceptance
- SC1: Code passes the provided tests unchanged (baseline).
- SC2: Additional negative/edge tests pass and document intended behavior.
- SC3: Code adheres to style guidelines (`implicit none`, intents, purity where applicable).
- SC4: Build is clean on fresh clone; no `.mod`/`.o` files tracked; warnings enabled with no warnings emitted.
- SC5: README provides quickstart instructions and links to plan/tasks.

## 6. Risks and Mitigations
- R1: Making `compute` pure may conflict with test harness usage. Mitigation: Verify purity is compatible (no I/O or global state) — safe given current design.
- R2: Tightening compiler warnings could reveal benign issues. Mitigation: fix issues or tune flags conservatively.
- R3: Over-expanding scope beyond Exercism needs. Mitigation: Keep changes minimal and gated behind documentation and optional tasks.

## 7. Phased Roadmap (aligned with TASKS.md)

### Phase 0 — Correctness and API (P0)
- Make `compute` a `pure` function; add `intent(in/out)` and ensure no side effects.
- Document API contract in code comments: unequal lengths => `.false.`, `distance` remains 0.
- Acceptance: All current tests pass; linter/manual review confirms purity and intents.

### Phase 1 — Code Quality and Style (P1)
- Ensure `implicit none` is present and intents are explicit everywhere.
- Introduce named kinds for clarity where useful; refactor minor clarity issues (local `n = len(strand1)`).
- Acceptance: Build with warnings shows no issues; code comments explain module purpose.

### Phase 2 — Tests (P2)
- Add edge-case tests: mixed case decision (document), whitespace handling, long input sanity tests.
- Property checks: identity distance=0, symmetry.
- Acceptance: New tests pass; verify `distance` remains 0 on failure.

### Phase 3 — Tooling and Build (P3)
- Add `.gitignore` to exclude `*.o`, `*.mod`, build directories, and executables; remove tracked `hamming.mod`.
- Enable warnings and standard flags in CMake for common compilers.
- Acceptance: Fresh clone + build is clean, no artifacts tracked.

### Phase 4 — Documentation (P4)
- Update README with quickstart (configure, build, run tests), API behavior, and links to TASKS.md and this plan.
- Add CONTRIBUTING.md and (optional) LICENSE if publicly shared.
- Acceptance: A newcomer can run tests in <5 minutes following README.

### Phase 5 — CI (optional, P5)
- GitHub Actions workflow to build and run tests on Ubuntu with gfortran.
- Acceptance: CI passes on PRs and main.

### Phase 6 — Portability (P6)
- Verify on multiple compilers (gfortran, ifort/nvfortran) or document support matrix.
- Acceptance: Compiles and passes tests on at least gfortran; notes for others.

### Phase 7 — Maintainability (P7)
- Consider interface patterns for potential future overloads; optionally offer an integer-returning variant in a separate module for educational purposes, without affecting the Exercism API.
- Acceptance: Clear separation; original API intact.

### Phase 8 — Examples and Pedagogy (P8)
- Add README snippet showing typical calls and outcomes.
- Acceptance: Example compiles and matches tests’ behavior.

### Phase 9 — Performance (P9)
- Optional micro-optimizations and a simple benchmarking script for long strings.
- Acceptance: No regressions; documentation of results.

## 8. Dependencies and Effort Hints
- P0, P1, P3, and P4 are low effort and high value; execute first.
- P2 introduces small test additions; ensure they don’t conflict with canonical tests if this is the reference solution.
- CI (P5) is optional; implement if repository is on GitHub and CI is desired.

## 9. Deliverables Checklist
- [ ] Purified and documented `compute` API (P0)
- [ ] Style and intents enforced (P1)
- [ ] Edge and property tests (P2)
- [ ] .gitignore and clean build flags (P3)
- [ ] Updated README + links to plan/tasks (P4)
- [ ] Optional CI workflow (P5)

---
This plan is intentionally incremental and minimal in code churn while bringing the project to a clear, documented, and maintainable state.