# TESTING_PHILOSOPHY.MD

## Guiding Principles

1.  **Purpose:** Tests exist to verify that the software meets functional requirements reliably and to prevent regressions. They should increase confidence in the codebase.
2.  **Simplicity & Clarity:** Tests should be simple, easy to understand, and maintainable. Complex test setup often indicates complex code that may need refactoring.
3.  **Behavior Over Implementation:** Tests should primarily verify the *behavior* of a component through its public interface/API, not its internal implementation details. This makes tests less brittle to refactoring.
4.  **Testability is a Design Goal:** Code should be designed with testability in mind *from the start*. If code is hard to test, consider refactoring the code *before* writing complex tests.

## Test Strategy & Priorities

1.  **Happy Path First:** Prioritize testing the primary success scenario (the "happy path") for any given feature or function.
2.  **Critical Edge Cases:** Next, cover critical edge cases and expected error conditions (e.g., invalid input, boundary conditions).
3.  **Workflows Over Units (Often):** Prefer tests that cover meaningful user workflows or interactions between components (Integration Tests) over highly isolated unit tests *if* those unit tests require extensive mocking.
4.  **Unit Tests for Logic:** Use simple unit tests for pure functions, complex algorithms, or critical utility functions that have clear inputs and outputs and don't require mocking.

## Mocking Policy

1.  **Minimize Mocking:** Mocks should be used sparingly. Excessive mocking makes tests brittle and coupled to implementation details.
2.  **Mock External Boundaries:** Only mock interfaces/abstractions that represent **external system boundaries** (e.g., Network I/O, File System, System Time, external APIs) that are impractical or undesirable to use in a test environment. Do *not* mock internal components or types you own simply for isolation.
3.  **Abstract First:** Ensure external dependencies are accessed through well-defined abstractions (interfaces, ports) before mocking them.
4.  **Refactor Signal:** If a component requires mocking many internal dependencies to be tested, it is a strong signal that the component may be doing too much or have poor separation of concerns. **Refactor the component first.**

## Test Characteristics to Strive For

* **Fast:** Tests should run quickly.
* **Deterministic:** Tests should produce the same result every time (no flakiness).
* **Readable:** Test code should clearly communicate *what* is being tested and *why*.
* **Robust:** Tests should not break unnecessarily due to unrelated implementation changes.
