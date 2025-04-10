# CONSULT
## 1. Formulate Consultation Request
- **Goal:** Clearly articulate the problem or need for guidance in a dedicated file.
- **Actions:**
    - Create a new file named `CONSULT-REQUEST.md`.
    - ***Think hard*** and populate this file with:
        - **`Goal:`** Original objective (Reference task/plan).
        - **`Problem/Blocker:`** Specific issue. **If related to testing, explain why it violates `TESTING_PHILOSOPHY.MD` (e.g., "Requires extensive mocking of internal component X," "Cannot test behavior without fragile implementation coupling").**
        - **`Context/History:`** Steps taken, attempts made (Reference `*-PLAN.md`, `BUGFIXPLAN.md`, etc.).
        - **`Key Files/Code Sections:`** Specific code areas involved.
        - **`Error Messages (if any):`** Relevant output.
        - **`Desired Outcome:`** What would success look like? (e.g., "A simpler testing strategy," "A refactoring suggestion to improve testability," "A way to achieve goal X without violating Y").

## 2. Identify Context Files/Directories
- **Goal:** Determine necessary project context for `thinktank`.
- **Actions:**
    - Review `CONSULT-REQUEST.md` and identify mentioned files/directories.
    - Include relevant code paths, potentially parent directories.
    - **Include `TESTING_PHILOSOPHY.MD` if the request involves testing.**
    - ***Think carefully*** to select sufficient context. Create a list of paths.

## 3. Invoke Thinktank CLI
- **Goal:** Request assistance via `thinktank`.
- **Actions:**
    - **Construct Command:**
        ```bash
        thinktank run --models google:gemini-2.5-pro-exp-03-25 CONSULT-REQUEST.md <path1> [path2...]
        ```
        (Replace paths with list from Step 2).
    - **Execute Command:** Run it.
    - **Handle Errors:** Report errors. Write any errors you encounter to a persistent log file. Attempt **one** retry if fixable, report failure and stop if unresolvable.
    - **Identify Output Directory:** Report success and output path.

## 4. Synthesize Architect's Response (`CONSULTANT-PLAN.md`)
- **Goal:** Understand and synthesize LLM responses into a single plan.
- **Actions:**
    - Read all model responses in the output directory.
    - **Synthesize Plan:** ***Think hard*** to create a coherent plan from insights, solutions, and steps. **If related to testing, ensure the synthesized plan aligns with `TESTING_PHILOSOPHY.MD`.**
    - Save synthesized plan to `CONSULTANT-PLAN.md`.

## 5. Process Synthesized Plan
- **Goal:** Execute the synthesized plan to resolve the original issue.
- **Actions:**
    - Read `CONSULTANT-PLAN.md`. Acknowledge receipt.
    - **Execute Plan:** Treat `CONSULTANT-PLAN.md` as the primary plan for this issue. Use standard `EXECUTE.MD` process for tasks within it if structured similarly. This supersedes previous plans *for this issue*.
    - Continue until resolved or plan completed.
    - (Optional Cleanup): Remove/archive `CONSULT-REQUEST.md`, `CONSULTANT-PLAN.md`.
