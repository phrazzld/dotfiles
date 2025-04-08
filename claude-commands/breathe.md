# BREATHE

**(Invoked because current progress may be suboptimal or divergent)**

## 1. PAUSE & RESET
- **Action:** Immediately halt the current execution step or thought process. Clear any short-term assumptions about the immediate next action.

## 2. RE-GROUND IN CONTEXT
- **Goal:** Re-establish verifiable context for the current task.
- **Actions:**
    - Identify the **exact** Task Title you are currently working on from `TODO.MD`.
    - Locate and carefully re-read the corresponding `<task-title>-PLAN.md` file.
    - Re-read relevant section(s) and AC Ref in `TODO.MD`.
    - **Review `TESTING_PHILOSOPHY.MD` if the issue relates to testing.**
    - If necessary, briefly review the original `PLAN.MD` section.

## 3. CRITICAL SELF-ASSESSMENT
- **Goal:** Evaluate the *current state* of your work against the grounded context.
- **Actions:** ***Think hard*** and answer the following questions explicitly:
    - **Alignment:** Is the work done *so far* and the immediate *next step* directly contributing to the goal in `<task-title>-PLAN.md`?
    - **Efficiency:** Is the current approach still the simplest, most direct way *according to the plan*? Or has it become overly complex?
    - **Progress:** Are you making tangible progress, or are you stuck, looping, or repeatedly failing checks?
    - **Compliance:** Does the current direction fully comply with project standards (`CONTRIBUTING.MD`, etc.) and ACs?
    - **Testability Check:** **Is the code proving difficult to test simply according to `TESTING_PHILOSOPHY.MD`? Does writing tests require complex mocks for internal components? Could this indicate a design flaw?**
    - **Improvement:** Considering the current state, is there now a *demonstrably better* way to complete the *remaining* work?

## 4. REPORT FINDINGS & RECOMMENDATION
- **Goal:** Communicate the assessment results clearly and propose the next step.
- **Actions:** Based *only* on the answers from Step 3:
    - **Scenario A: Stay the Course.** If aligned, efficient, progressing, compliant, testable, and optimal:
        - State: "Assessment complete. Current approach remains valid. Resuming task."
        - (Proceed to resume).
    - **Scenario B: Course Correction Needed.** If deviation, inefficiency, lack of progress, non-compliance, **poor testability indicating design issues**, or a clearly better alternative exists:
        - State: "Assessment complete. Course correction recommended."
        - **Summarize Problem:** Explain *why* (e.g., "Stuck on test setup due to complex dependencies," "Current approach requires excessive mocking violating TESTING_PHILOSOPHY.MD," "Alternative approach Q simplifies design and testing...").
        - **Propose New Approach:** Outline the proposed fix or alternative (e.g., "Propose refactoring component X for better testability before proceeding," "Suggest switching to alternative approach Q."). Consider invoking `propose-testable-refactor` or `consult` if appropriate.
        - State: "Awaiting confirmation to proceed."
        - (Do **not** proceed until confirmation).
