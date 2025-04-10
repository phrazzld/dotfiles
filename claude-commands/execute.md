# EXECUTE
## 1. SELECT TASK
- **Goal:** Choose the next appropriate task to work on from `TODO.MD`.
- **Action:** Scan `TODO.MD` for tasks marked `[ ]` (incomplete). Select the first task found whose prerequisites listed in its `Depends On:` field are already marked `[x]` (complete) or are 'None'. Record the exact Task Title.
- **Mark In-Progress:** After selecting a task, update it in `TODO.MD` by changing `[ ]` to `[~]` to indicate it's in progress.

## 2. PREPARE TASK PROMPT (for Implementation Plan)
- **Goal:** Create a dedicated prompt file for `architect` to generate implementation approaches.
- **Actions:**
    - **Filename:** Sanitize Task Title -> `<sanitized-task-title>-TASK.md`.
    - **Analyze:** Re-read task details (Action, AC Ref, Depends On) from `TODO.MD` and the relevant section in `PLAN.MD`.
    - **Retrieve Base Prompt:** Copy the content from `prompts/execute.md` to use as the base for your task prompt.
    - **Customize Prompt:** Create `<sanitized-task-title>-TASK.md` by adding task-specific details to the base prompt:
        - Add task title, description, and acceptance criteria at the top.
        - Keep all the original instructions from the base prompt.
        - Ensure the prompt maintains the focus on standards alignment.

## 3. GENERATE IMPLEMENTATION PLAN WITH ARCHITECT
- **Goal:** Use `architect` to generate an implementation plan based on the task prompt and project context.
- **Actions:**
    - **Find Task Context:**
        1. Find the top ten most relevant files for task-specific context
    - **Run Architect:**
        1. Run `architect --instructions <sanitized-task-title>-TASK.md --output <sanitized-task-title>-PLAN.md docs/philosophy/ [top-ten-relevant-files]`
    - If you encounter an error, write it to a persistent logfile and try again.
    - Report success/failure. Stop on unresolvable errors.
    - **Review Plan:** Verify the implementation plan aligns with our standards hierarchy:
        1. Simplicity and clarity over cleverness (`CORE_PRINCIPLES.md`)
        2. Clean separation of concerns (`ARCHITECTURE_GUIDELINES.md`)
        3. Straightforward testability with minimal mocking (`TESTING_STRATEGY.md`)
        4. Adherence to coding conventions (`CODING_STANDARDS.md`)
        5. Support for clear documentation (`DOCUMENTATION_APPROACH.md`)
    - (Optional Cleanup): Remove `<sanitized-task-title>-TASK.md`.

## 4. IMPLEMENT FUNCTIONALITY
- **Goal:** Write the code to satisfy the task requirements according to the implementation plan.
- **Actions:**
    - **Consult Standards:** Review `CONTRIBUTING.MD`, `CODING_STANDARDS.md`, `ARCHITECTURE_GUIDELINES.md`, etc.
    - **Write Code:** Implement the functionality based on `<sanitized-task-title>-PLAN.md`.
    - **Adhere Strictly:** Follow project standards and the chosen plan.
- **Guidance:** Focus on clean, readable code that directly addresses requirements.

## 5. TESTABILITY REVIEW & REFACTOR (Inline)
- **Goal:** Review the newly written code against all standards documents *before* writing tests, with special attention to testability.
- **Actions:**
    - **Review Code:** Analyze the code files just modified for Step 5.
    - **Assess Standards Compliance:** ***Think hard*** and evaluate against all standards:
        - **Core Principles:** "Does this implementation embrace simplicity? Does it have clear responsibilities? Is it explicit rather than implicit?" (`CORE_PRINCIPLES.md`)
        - **Architecture:** "Is there clean separation between core logic and infrastructure? Are dependencies pointing inward?" (`ARCHITECTURE_GUIDELINES.md`)
        - **Code Quality:** "Does it follow our coding conventions? Does it leverage types effectively? Does it prefer immutability?" (`CODING_STANDARDS.md`)
        - **Testability:** "Can this code be tested simply? Does it require complex setup or extensive mocking of internal components?" (`TESTING_STRATEGY.md`)
        - **Documentation:** "Are design decisions clear? Would comments explain the 'why' not just the 'what'?" (`DOCUMENTATION_APPROACH.md`)
    - **Identify Refactors:** If any standard is not met, identify the **minimal necessary refactoring** to address the issues:
        - For simplicity issues: Extract responsibilities, reduce complexity
        - For architectural issues: Improve separation of concerns, realign dependencies
        - For code quality issues: Apply coding conventions, use types more effectively
        - For testability issues: Reduce coupling, extract pure functions, improve interfaces
        - For documentation issues: Clarify design decisions with appropriate comments
    - **Perform Refactor (if needed):** Apply the identified minimal refactoring changes.
    - **Document (if refactored):** Briefly note any refactoring performed in `<sanitized-task-title>-PLAN.md` or as code comments, specifying which standard(s) the refactoring helps satisfy.

## 6. WRITE FAILING TESTS
- **Goal:** Define expected behavior via tests, adhering strictly to the testing philosophy.
- **Actions:**
    - **Consult All Standards:** Review task requirements (`AC Ref:`, `<sanitized-task-title>-PLAN.md`) and adhere to all standards, with particular focus on testing:
        - Ensure tests reflect the simplicity principle (`CORE_PRINCIPLES.md`)
        - Test through public interfaces as defined in the architecture (`ARCHITECTURE_GUIDELINES.md`)
        - Follow coding standards in test code too (`CODING_STANDARDS.md`)
        - **Strictly adhere to testing principles, avoiding mocks of internal components** (`TESTING_STRATEGY.md`)
        - Document test rationale where needed (`DOCUMENTATION_APPROACH.md`)
    - **Write Happy Path Tests:** Write the minimum tests needed to verify the core *behavior* for the happy path, focusing on the public interface. **Prioritize tests that avoid mocking internal components.**
    - **Write Critical Edge Case Tests:** Add tests for important error conditions or edge cases identified.
    - **Verify Test Simplicity:** ***Think hard*** - "Are these tests simple? Do they avoid complex setup? Do they rely on mocking internal code? If yes, revisit Step 6 or the test approach itself."
    - Ensure tests currently fail (as appropriate for TDD/BDD style).
- **Guidance:** Test *behavior*, not implementation. **Aggressively avoid unnecessary mocks.** If mocking seems unavoidable for internal logic, it's a failure signal.

## 7. RUN IMPLEMENTATION & TESTS
- **Goal:** Make the implementation code pass the newly written tests.
- **Actions:**
    - Run the code and tests.
    - Debug and modify the *implementation code* (from Step 4/5) until all tests written in Step 6 pass.
    - **Do NOT modify tests to make them pass unless the test itself was flawed.**

## 8. FINALIZE & COMMIT
- **Goal:** Ensure work is complete, passes all checks, and is recorded.
- **Actions:**
    - **Run Checks & Fix:** Execute linting, building, and the **full test suite**. Fix *any* code issues causing failures.
    - **Update Task Status:** Change the task status in `TODO.MD` from `[~]` (in progress) to `[x]` (complete).
    - **Commit Changes:**
        - Stage *all* relevant changed/new files (`<sanitized-task-title>-PLAN.md`, implementation code, test code, refactored code). Review diff (`git diff --staged`).
        - Use Conventional Commits (`type(scope): subject`). Include brief description of any inline testability refactors in the commit body if applicable. Reference the task.
        - Execute `git commit`. Handle hooks/errors. Report success or failure.
