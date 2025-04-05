# BREATHE

**(Invoked because current progress may be suboptimal or divergent)**

## 1. PAUSE & RESET
- **Action:** Immediately halt the current execution step or thought process. Clear any short-term assumptions about the immediate next action.

## 2. RE-GROUND IN CONTEXT
- **Goal:** Re-establish verifiable context for the current task.
- **Actions:**
    - Identify the **exact** Task Title you are currently working on from `TODO.MD`.
    - Locate and carefully re-read the corresponding `<task-title>-PLAN.md` file created during the planning phase for this task. Pay close attention to the stated goal and chosen approach.
    - Locate and re-read the relevant section(s) and Acceptance Criteria (`AC Ref:`) for this task in `TODO.MD`.
    - If necessary for broader context, briefly review the original `PLAN.MD` section related to this task/feature.

## 3. CRITICAL SELF-ASSESSMENT
- **Goal:** Evaluate the *current state* of your work against the grounded context.
- **Actions:** ***Think hard*** and answer the following questions explicitly:
    - **Alignment:** Is the work done *so far* and the immediate *next step* you were about to take directly contributing to the goal and chosen approach documented in `<task-title>-PLAN.md`?
    - **Efficiency:** Is the current approach still the simplest, most direct way to achieve the task's goal *according to the plan*? Or has it become overly complex or convoluted?
    - **Progress:** Are you making tangible progress, or are you stuck, looping, or repeatedly failing checks (linting, tests, build)?
    - **Compliance:** Does the current direction fully comply with project standards (from `CONTRIBUTING.MD` or equivalent) and the task's Acceptance Criteria?
    - **Improvement:** Considering the current state, is there now a *demonstrably better* (simpler, faster, more robust, more compliant) way to complete the *remaining* work for this task?

## 4. REPORT FINDINGS & RECOMMENDATION
- **Goal:** Communicate the assessment results clearly and propose the next step.
- **Actions:** Based *only* on the answers from Step 3:
    - **Scenario A: Stay the Course.** If the assessment confirms the current path is aligned, efficient, progressing, compliant, and still the best approach:
        - State clearly: "Assessment complete. Current approach remains valid and optimal. Resuming task execution."
        - (Proceed to resume the task from where you paused).
    - **Scenario B: Course Correction Needed.** If the assessment reveals significant deviation, inefficiency, lack of progress, non-compliance, or a clearly better alternative approach:
        - State clearly: "Assessment complete. Course correction recommended."
        - **Summarize the Problem:** Briefly explain *why* the current approach is now deemed suboptimal (e.g., "Deviated from plan by attempting X," "Stuck on Y," "Overly complex Z identified," "Alternative approach Q is simpler because...").
        - **Propose New Approach:** Clearly outline the proposed new approach or the specific fix needed.
        - State clearly: "Awaiting confirmation to proceed with the new approach."
        - (Do **not** proceed until user confirmation is received).
