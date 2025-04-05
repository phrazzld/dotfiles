# CONSULT
## 1. Formulate Consultation Request
- **Goal:** Clearly articulate the problem or need for guidance in a dedicated file.
- **Actions:**
    - Create a new file named `CONSULT-REQUEST.md`.
    - ***Think hard*** and populate this file with the following details:
        - **`Goal:`** What were you originally trying to achieve? (Reference original task/plan if applicable).
        - **`Problem/Blocker:`** Describe the specific issue you're facing or the guidance needed.
        - **`Context/History:`** What steps have you taken so far? What have you tried? (Reference `<task>-PLAN.md`, `BUGFIXPLAN.md`, etc., if relevant).
        - **`Key Files/Code Sections:`** Mention specific files or code areas involved.
        - **`Error Messages (if any):`** Include relevant error output.
        - **`Desired Outcome:`** What would a successful resolution or plan look like?

## 2. Identify Context Files/Directories
- **Goal:** Determine the necessary project context to provide to the Architect tool.
- **Actions:**
    - Review `CONSULT-REQUEST.md` and identify all explicitly mentioned files or directories.
    - Analyze the code paths related to the problem area.
    - Consider including parent directories to provide broader context if appropriate.
    - ***Think carefully*** to select a set of existing file and/or directory paths that give the Architect sufficient context without being excessive. Create a list of these paths.

## 3. Invoke Architect CLI
- **Goal:** Request assistance from the Architect tool, providing the formulated request and context.
- **Actions:**
    - **Construct Command:** Prepare the `architect` CLI command as follows:
        ```bash
        architect --task-file CONSULT-REQUEST.md --output ARCHITECT-PLAN.md --verbose <path1> [path2...]
        ```
        - Replace `<path1> [path2...]` with the list of context file/directory paths identified in Step 2.
    - **(Optional Safety Check):** Consider running first with the `--dry-run` flag to verify the context files and estimated token count.
    - **Execute Command:** Run the constructed `architect` CLI command.
    - **Handle Errors:** If the command fails (e.g., CLI error, API error, file not found):
        - Report the specific error message received from the CLI.
        - Analyze the error. If it's correctable (e.g., typo in path, missing file), attempt to fix the command and retry **once**.
        - If it fails again or is uncorrectable, report "Architect CLI invocation failed. See error above. Manual assistance required." and **stop**.
    - **Confirm Success:** If the command completes successfully, it should create `ARCHITECT-PLAN.md`. Report "Architect CLI invocation successful. Received ARCHITECT-PLAN.md."

## 4. Process Architect's Response
- **Goal:** Understand and execute the plan provided by the Architect.
- **Actions:**
    - Carefully read the generated `ARCHITECT-PLAN.md`.
    - Acknowledge receipt and understanding (e.g., "Initiating execution of ARCHITECT-PLAN.md.").
    - **Execute the Plan:** Treat `ARCHITECT-PLAN.md` as the primary plan for resolving the consulted issue. If it contains actionable tasks similar to those in `TODO.MD`, use the standard `EXECUTE.MD` process for each task outlined within `ARCHITECT-PLAN.md`. This plan supersedes previous plans *for this specific issue*.
    - Continue working through the `ARCHITECT-PLAN.md` tasks until the original problem (from Step 1) is resolved or the plan is completed.
    - **(Optional Cleanup):** Once the Architect's plan is successfully completed and the issue resolved, consider removing the `CONSULT-REQUEST.md` and `ARCHITECT-PLAN.md` files (or archiving them appropriately).
