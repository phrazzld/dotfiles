# QUICK EXECUTE

## 1. SELECT TASK

- **Goal:** Choose the next appropriate task to work on from `TODO.MD`.
- **Action:** Scan `TODO.MD` for tasks marked `[ ]` (incomplete). Select the first task found whose prerequisites listed in its `Depends On:` field are already marked `[x]` (complete) or are 'None'. Record the exact Task Title.

## 2. PLAN APPROACH

- **Goal:** Understand the task, determine the best implementation strategy, and document it.
- **Actions:**
    - **Analyze:** Re-read the selected task details (Action, AC Ref, Depends On) from `TODO.MD`.
    - **Brainstorm:** ***Think hard*** about potential approaches (2-3) to implement the functionality. Consider trade-offs (simplicity, performance, maintainability, alignment with existing patterns).
    - **Select:** ***Think hard*** to select the most suitable approach and document the reasoning for your choice.
    - **Filename:** Sanitize the exact Task Title recorded in Step 1 to create a valid filename (e.g., lowercase, replace spaces and special characters with hyphens). Append `-PLAN.md` to this sanitized string.
    - **Document:** Create and write the following to the new `<sanitized-task-title>-PLAN.md` file:
        - The original Task Title.
        - A brief summary of the task's goal.
        - A short description of the chosen implementation approach.
        - Key reasoning behind selecting this approach over alternatives.

## 3. WRITE FAILING TESTS (IF APPLICABLE)

- **Goal:** Define the expected *happy path* behavior via tests before implementing the code.
- **Actions:**
    - Consult the task requirements (`AC Ref:` in `TODO.MD`) and the plan (`<sanitized-task-title>-PLAN.md`).
    - ***Think hard*** about the primary successful outcome (the "happy path") for this task.
    - Write the minimum number of simple tests required to verify this core happy path functionality.
    - If obvious and critical edge cases were identified during planning, consider adding minimal tests for those *after* the happy path is covered.
    - Ensure these tests currently fail (as the functionality isn't implemented yet).
- **Guidance:** Test *behavior/outcomes*, not implementation details. Skip this step entirely if the task isn't directly testable (e.g., documentation updates, refactoring with no behavioral change).

## 4. IMPLEMENT FUNCTIONALITY

- **Goal:** Write the code to satisfy the task requirements according to the plan and make the tests pass.
- **Actions:**
    - **Consult Standards:** Locate and review project documentation regarding coding standards (e.g., `CONTRIBUTING.MD`, `STYLEGUIDE.MD`, or other relevant files).
    - **Write Code:** Implement the functionality based on the chosen approach documented in `<sanitized-task-title>-PLAN.md`.
    - **Adhere Strictly:** Ensure the code rigorously follows the project's coding standards, patterns, and conventions identified above.
- **Guidance:** Focus on clean, readable, and maintainable code that directly addresses the task requirements and passes the tests written in Step 3.

## 5. FINALIZE & COMMIT

- **Goal:** Ensure the work is complete, integrated correctly, adheres to quality checks, and is recorded.
- **Actions:**
    - **Run Checks & Fix:** Execute linting, building, and testing processes. If *any* warnings or errors occur, you *must* debug the code and fix the issues. Repeat the checks until they all pass cleanly. Only report failure and stop if you are completely unable to resolve an issue after diligent attempts.
    - **Mark Complete:** Modify the corresponding task line in `TODO.MD` by changing `[ ]` to `[x]`.
    - **Commit Changes:**
        - Stage all relevant changed/new files, including the new `<sanitized-task-title>-PLAN.md` file and the code/test changes (`git add`). Review the diff (`git diff --staged`) to ensure correctness and adherence to standards.
        - Create a commit message using the Conventional Commits specification (`type(scope): subject`). The `type` must accurately reflect the work (e.g., `feat`, `fix`, `refactor`, `test`, `chore`, `docs`). The description should clearly state what was accomplished. Reference the related task if helpful (e.g., in the commit body).
        - Execute the commit (`git commit`). If the commit itself fails (e.g., hooks), attempt to resolve the issue or report the specific error and stop.

