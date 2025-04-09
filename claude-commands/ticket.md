# TICKET

## 1. Analyze Plan File (`PLAN.md`)
- **Goal:** Thoroughly understand the requirements, dependencies, and potential issues in `PLAN.md`.
- **Actions:**
    - Extract primary features, user stories, or distinct sections.
    - Identify all explicit Acceptance Criteria (ACs).
    - Identify dependencies: technical prerequisites, data needs, sequence requirements between features/tasks.
    - Note any ambiguities, contradictions, missing information, or areas requiring assumptions.
- **Instruction:** ***Think hard*** during this analysis to uncover implicit dependencies or potential edge cases not explicitly stated.

## 2. Generate Task Breakdown (`TODO.md`)
- **Goal:** Create a detailed, actionable list of tasks required to implement the plan enumerated in `PLAN.md`.
- **Format:** Use the structure provided below.
- **Actions:**
    - **Decomposition:** Break down features/stories from `PLAN.md` into the smallest logical, implementable tasks. Aim for atomicity – each task should represent a single, focused piece of work. ***Think hard*** to ensure comprehensive breakdown.
    - **Clarity:** Write task titles that are clear, concise, and action-oriented (verb-first).
    - **Traceability:** Link each task back to the specific Acceptance Criteria (`AC Ref:`) it helps fulfill.
    - **Dependency Mapping:** For each task, accurately identify and list prerequisite tasks in the `Depends On:` field using their exact titles. If none, state 'None'. ***Think carefully*** about the sequence of operations.
    - **Clarifications:** Create entries in the `[!] CLARIFICATIONS NEEDED / ASSUMPTIONS` section for each ambiguity or assumption noted in Step 1.

```
# TODO

## [Feature/Section Name]
- [ ] **Task Title:** Verb-first, clear action
  - **Action:** Specific steps or description of *what* needs to be done and the expected outcome.
  - **Depends On:** Exact Task Title(s) of prerequisite(s), or 'None'.
  - **AC Ref:** List corresponding Acceptance Criteria ID(s) from `PLAN.md` (e.g., AC 1.1, AC 2.3).

## [!] CLARIFICATIONS NEEDED / ASSUMPTIONS
- [ ] **Issue/Assumption:** Describe the ambiguity found or assumption made during analysis.
  - **Context:** Reference the relevant part(s) of `PLAN.md`.
```

## 3. Validate Coverage and Dependencies
- **Goal:** Ensure the generated `TODO.md` accurately reflects the plan and task relationships, and is written to a local `TODO.md` file.
- **Actions:**
    - **Completeness Check:** Confirm that every Feature and Acceptance Criterion from `PLAN.md` is addressed by at least one task or is noted in the Clarifications section. ***Think hard*** to catch any missed requirements.
    - **Dependency Check:** Review the `Depends On:` fields. Ensure the listed dependencies make logical sense and that there are no obvious circular dependencies or missing links identified during decomposition.
