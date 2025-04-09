# EXECUTE
## 1. SELECT TASK
- **Goal:** Choose the next appropriate task to work on from `TODO.MD`.
- **Action:** Scan `TODO.MD` for tasks marked `[ ]` (incomplete). Select the first task found whose prerequisites listed in its `Depends On:` field are already marked `[x]` (complete) or are 'None'. Record the exact Task Title.

## 2. PREPARE TASK PROMPT (for Implementation Plan)
- **Goal:** Create a dedicated prompt file detailing the task for `thinktank` to generate implementation approaches.
- **Actions:**
    - **Filename:** Sanitize Task Title -> `<sanitized-task-title>-TASK.md`.
    - **Analyze:** Re-read task details (Action, AC Ref, Depends On) from `TODO.MD` and the relevant section in `PLAN.MD`.
    - **Document Prompt:** Create `<sanitized-task-title>-TASK.md` with task details and a request for 2-3 implementation approaches, including pros/cons, and a recommended approach considering project standards and **testability principles from TESTING_PHILOSOPHY.MD**. (Similar structure to the prompt in the previous version of execute.md).

## 3. GENERATE APPROACHES WITH THINKTANK
- **Goal:** Use `thinktank` to generate potential implementation approaches based on the task prompt and project context.
- **Actions:**
    - Run `thinktank run --group faves <sanitized-task-title>-TASK.md ./` (with context error handling as in `plan.md`).
    - If you encounter an error, write it to a persistent logfile and try again.
    - Identify output directory. Report success/failure. Stop on unresolvable errors.

## 4. SYNTHESIZE IMPLEMENTATION PLAN
- **Goal:** Consolidate `thinktank` suggestions into a single, chosen implementation plan, prioritizing testability.
- **Actions:**
    - Read all `thinktank` responses from the output directory.
    - **Synthesize & Select:** ***Think hard*** to analyze suggestions. Select the most suitable approach, **strongly prioritizing testability and maintainability according to TESTING_PHILOSOPHY.MD**.
    - **Filename:** Create `<sanitized-task-title>-PLAN.md`.
    - **Document Plan:** Record Task Title, goal, chosen approach, and **explicit reasoning for the choice, highlighting testability considerations.**
    - (Optional Cleanup): Remove `<sanitized-task-title>-TASK.md`.

## 5. IMPLEMENT FUNCTIONALITY
- **Goal:** Write the code to satisfy the task requirements according to the synthesized implementation plan.
- **Actions:**
    - **Consult Standards:** Review `CONTRIBUTING.MD`, `BEST_PRACTICES.MD`, etc.
    - **Write Code:** Implement the functionality based on `<sanitized-task-title>-PLAN.md`.
    - **Adhere Strictly:** Follow project standards and the chosen plan.
- **Guidance:** Focus on clean, readable code that directly addresses requirements.

## 6. TESTABILITY REVIEW & REFACTOR (Inline)
- **Goal:** Ensure the newly written code is testable according to `TESTING_PHILOSOPHY.MD` *before* writing tests.
- **Actions:**
    - **Review Code:** Analyze the code files just modified for Step 5.
    - **Assess Testability:** ***Think hard*** and evaluate: "Based on `TESTING_PHILOSOPHY.MD`, can this code be tested simply? Does it require complex setup or extensive mocking (especially of internal components)?"
    - **Identify Refactors:** If testability is poor (e.g., requires heavy mocking), identify the **minimal necessary refactoring** within the implemented code to improve its testability (e.g., extracting a pure function, improving separation of concerns, introducing an interface for an external dependency).
    - **Perform Refactor (if needed):** Apply the identified minimal refactoring changes.
    - **Document (if refactored):** Briefly note the testability refactor performed in `<sanitized-task-title>-PLAN.md` or as code comments.

## 7. WRITE FAILING TESTS
- **Goal:** Define expected behavior via tests, adhering strictly to the testing philosophy.
- **Actions:**
    - **Consult Plan & Philosophy:** Review task requirements (`AC Ref:`, `<sanitized-task-title>-PLAN.md`) and **strictly adhere to `TESTING_PHILOSOPHY.MD`**.
    - **Write Happy Path Tests:** Write the minimum tests needed to verify the core *behavior* for the happy path, focusing on the public interface. **Prioritize tests that avoid mocking internal components.**
    - **Write Critical Edge Case Tests:** Add tests for important error conditions or edge cases identified.
    - **Verify Test Simplicity:** ***Think hard*** - "Are these tests simple? Do they avoid complex setup? Do they rely on mocking internal code? If yes, revisit Step 6 or the test approach itself."
    - Ensure tests currently fail (as appropriate for TDD/BDD style).
- **Guidance:** Test *behavior*, not implementation. **Aggressively avoid unnecessary mocks.** If mocking seems unavoidable for internal logic, it's a failure signal.

## 8. RUN IMPLEMENTATION & TESTS
- **Goal:** Make the implementation code pass the newly written tests.
- **Actions:**
    - Run the code and tests.
    - Debug and modify the *implementation code* (from Step 5/6) until all tests written in Step 7 pass.
    - **Do NOT modify tests to make them pass unless the test itself was flawed.**

## 9. FINALIZE & COMMIT
- **Goal:** Ensure work is complete, passes all checks, and is recorded.
- **Actions:**
    - **Run Checks & Fix:** Execute linting, building, and the **full test suite**. Fix *any* code issues causing failures.
    - **Move to DONE:** Remove the completed task from `TODO.MD` and move it to `DONE.MD` with date of completion.
    - **Commit Changes:**
        - Stage *all* relevant changed/new files (`<sanitized-task-title>-PLAN.md`, implementation code, test code, refactored code). Review diff (`git diff --staged`).
        - Use Conventional Commits (`type(scope): subject`). Include brief description of any inline testability refactors in the commit body if applicable. Reference the task.
        - Execute `git commit`. Handle hooks/errors. Report success or failure.
