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
    - **Review our standards documents relevant to the current issue:**
      - `CORE_PRINCIPLES.md` for fundamental design principles
      - `ARCHITECTURE_GUIDELINES.md` for structural patterns 
      - `CODING_STANDARDS.md` for implementation practices
      - `TESTING_STRATEGY.md` for testing approaches
      - `DOCUMENTATION_APPROACH.md` for documentation practices
    - If necessary, briefly review the original `PLAN.MD` section.

## 3. CRITICAL SELF-ASSESSMENT
- **Goal:** Evaluate the *current state* of your work against the grounded context.
- **Actions:** ***Think hard*** and answer the following questions explicitly:
    - **Alignment:** Is the work done *so far* and the immediate *next step* directly contributing to the goal in `<task-title>-PLAN.md`?
    - **Efficiency:** Is the current approach still the simplest, most direct way *according to the plan*? Or has it become overly complex?
    - **Progress:** Are you making tangible progress, or are you stuck, looping, or repeatedly failing checks?
    - **Compliance:** Does the current direction fully comply with project standards and ACs? Specifically, does it align with:
        - Core principles of simplicity and modularity (`CORE_PRINCIPLES.md`)?
        - Architectural patterns and separation of concerns (`ARCHITECTURE_GUIDELINES.md`)?
        - Coding conventions and practices (`CODING_STANDARDS.md`)?
        - Testing principles that minimize mocking (`TESTING_STRATEGY.md`)?
        - Documentation approaches that explain rationale (`DOCUMENTATION_APPROACH.md`)?
    - **Standards-Based Evaluation:** Assess the implementation against our key standards:
        - **Simplicity Check:** Is the code becoming overly complex? Are responsibilities clear? (`CORE_PRINCIPLES.md`)
        - **Architecture Check:** Does the code maintain separation of concerns? Do dependencies point inward? (`ARCHITECTURE_GUIDELINES.md`)
        - **Code Quality Check:** Does the implementation follow our coding standards? Are types used effectively? (`CODING_STANDARDS.md`) 
        - **Testability Check:** Does writing tests require complex mocks for internal components? (`TESTING_STRATEGY.md`)
        - **Documentation Check:** Can design decisions be clearly explained? Are the "whys" documented? (`DOCUMENTATION_APPROACH.md`)
    - **Improvement:** Considering the current state, is there now a *demonstrably better* way to complete the *remaining* work?

## 4. REPORT FINDINGS & RECOMMENDATION
- **Goal:** Communicate the assessment results clearly and propose the next step.
- **Actions:** Based *only* on the answers from Step 3:
    - **Scenario A: Stay the Course.** If the work is aligned with plan, progressing efficiently, and compliant with all our standards:
        - State: "Assessment complete. Current approach remains valid and aligned with all standards. Resuming task."
        - (Proceed to resume).
    - **Scenario B: Course Correction Needed.** If there are issues with any of the following:
        - Deviation from plan
        - Inefficiency or complexity
        - Lack of progress
        - Non-compliance with any of our standards
        - Design flaws revealed through implementation
        - A demonstrably better alternative exists
        
        Then:
        - State: "Assessment complete. Course correction recommended."
        - **Summarize Problem:** Explain *why*, referencing the specific standard being violated (e.g., "Current approach violates simplicity principle in CORE_PRINCIPLES.md by introducing unnecessary abstraction," "Implementation mixes concerns contrary to ARCHITECTURE_GUIDELINES.md," "Current approach requires excessive mocking violating TESTING_STRATEGY.md," "Code doesn't follow type usage recommendations in CODING_STANDARDS.md").
        - **Propose New Approach:** Outline the proposed fix or alternative (e.g., "Propose refactoring component X for better testability before proceeding," "Suggest switching to alternative approach Q."). Consider invoking `propose-testable-refactor` or `consult` if appropriate.
        - State: "Awaiting confirmation to proceed."
        - (Do **not** proceed until confirmation).
