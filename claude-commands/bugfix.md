A bug report has been provided in BUG.md. Carefully perform the following steps explicitly:

1. **Triage and Hypothesis Formation**
   - **Think carefully** as you reproduce and verify the bug:
     - Explicitly document the Reproduction Steps.
     - Clearly state Expected vs. Actual behavior.
     - Identify and explicitly document the most likely components or code paths involved.
   - **Think hard** to form initial hypotheses about potential causes.
   - Explicitly note if user error seems highly probable, clearly explaining your reasoning.

2. **Structured Debugging**
   - **Thoughtfully choose** your most promising debugging steps (isolating variables, adding logs, unit tests, bisecting recent changes).
   - Explicitly document each debugging attempt clearly and chronologically:
     - **Think carefully** about each step before you perform it.
     - Explicitly state exactly what was tried, the precise outcome, and **carefully reason** about what each outcome reveals about the bug.
     - **Reflect thoroughly** on each outcome, updating your hypotheses explicitly based on new insights gained.

3. **Iterative Debugging Loop**
   - Continue explicitly iterating this debugging approach until the bug is definitively fixed:
     - **Think hard** about each new insight to refine your understanding further.
     - Confirm explicitly and clearly document when your fix resolves the issue.
     - Clearly summarize exactly what code or configuration change resolved the bug.

4. **Postmortem and Reflection**
   - After fixing the bug, **thoughtfully produce** a concise, structured postmortem that clearly includes:
     - Root cause explicitly summarized.
     - Timeline of debugging steps explicitly documented.
     - Clearly stated final resolution.
     - Explicit and thoughtful recommendations to prevent recurrence.
   - **Think carefully** as you commit all changes, explicitly documenting the resolution and referencing the postmortem.

Follow this explicitly structured process, thoughtfully leveraging deep reasoning at each step. Explicitly request clarification whenever uncertainty arises.
