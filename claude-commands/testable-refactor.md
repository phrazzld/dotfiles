# PROPOSE-TESTABLE-REFACTOR

## 1. Identify Target Code & Problem
- **Goal:** Clearly define the scope and the testability problem.
- **Actions:**
    - Identify the specific file(s) or component(s) exhibiting poor testability.
    - Identify the current Task Title being worked on (from `TODO.MD` or context).
    - Create a file named `REFACTOR-PROMPT.md`.
    - Populate `REFACTOR-PROMPT.md` with:
        ```markdown
        # Testability Refactor Proposal Request

        ## Context
        - **Task:** [Insert Current Task Title]
        - **Target Code:** [List specific file(s) and/or component/function names]
        - **Problem:** The target code is proving difficult to test according to `TESTING_PHILOSOPHY.MD`.
        - **Specific Issue:** [Describe *why* it's hard to test. E.g., "Requires extensive mocking of internal methods X and Y," "Tightly coupled to concrete class Z, preventing simple input/output testing," "Mixes business logic with I/O, making behavior verification complex."]

        ## Request
        Analyze the target code (`<target_path_1>`, `<target_path_2>...`) within the project context. Propose **minimal, targeted refactoring changes** to the target code *only* with the primary goal of improving its **testability** according to `TESTING_PHILOSOPHY.MD`.

        The refactoring should:
        1.  **Maintain existing functionality.**
        2.  Focus *solely* on improving testability (e.g., better separation of concerns, dependency injection, extracting pure functions).
        3.  Be the *least disruptive* change that significantly improves testability.
        4.  Make the code easier to test with simple inputs/outputs and minimal mocking.

        Provide:
        - A clear description of the proposed refactoring steps.
        - Code snippets illustrating the 'before' and 'after' if helpful.
        - Justification for why the proposed changes improve testability according to `TESTING_PHILOSOPHY.MD`.
        ```
    - Identify the list of target code file paths (`<target_path_1>`, etc.) needed for context. Include `TESTING_PHILOSOPHY.MD`.

## 2. Generate Refactor Proposal with Thinktank
- **Goal:** Use `thinktank` to generate refactoring suggestions focused purely on testability.
- **Actions:**
    - **Construct Command:**
        ```bash
        thinktank run --group faves REFACTOR-PROMPT.md <target_path_1> [target_path_2...] TESTING_PHILOSOPHY.MD [other_relevant_context_paths...]
        ```
    - **Execute Command:** Run it.
    - **Handle Errors:** Report errors, attempt **one** retry if fixable, report failure and stop if unresolvable.
    - **Identify Output Directory:** Report success and output path.

## 3. Synthesize Refactor Plan (`REFACTOR-SUGGESTION.MD`)
- **Goal:** Consolidate `thinktank` suggestions into a single, actionable refactoring plan.
- **Actions:**
    - Read all model responses in the output directory.
    - **Synthesize Plan:** ***Think hard*** to create a single, coherent refactoring plan focused *only* on the minimal changes needed for testability, drawing from the best suggestions. Ensure it adheres strictly to the prompt's constraints (maintain functionality, minimal disruption).
    - Save the synthesized plan to `REFACTOR-SUGGESTION.MD`.
    - (Optional Cleanup): Remove `REFACTOR-PROMPT.md`.

## 4. Review and Apply Refactor
- **Goal:** Review the proposed refactoring and apply it before proceeding with testing.
- **Actions:**
    - Carefully review `REFACTOR-SUGGESTION.MD`.
    - **If the plan is acceptable:**
        - Apply the refactoring changes to the target code files.
        - Add comments indicating the refactor (e.g., `// REFACTOR (Testability): Extracted pure function XYZ`).
        - Stage and commit these refactoring changes *separately* or as part of the main task commit (indicate clearly in commit message). Use commit type `refactor`. E.g., `refactor(component): improve testability by extracting pure function`
        - Report: "Testability refactoring applied successfully based on REFACTOR-SUGGESTION.MD. Proceeding with task."
        - **Return control** to the previous process (likely the `EXECUTE` command, ready to proceed to writing tests for the now-refactored code).
    - **If the plan is unacceptable (too complex, changes functionality, etc.):**
        - Report: "Proposed testability refactoring in REFACTOR-SUGGESTION.MD is not suitable. [Brief reason]. Manual review or alternative approach needed."
        - **Stop.** Requires manual intervention or potentially invoking `consult`.
