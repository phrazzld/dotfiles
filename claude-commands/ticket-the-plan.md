## 1. Carefully Analyze PLAN.md
- **Think hard** and thoroughly review the provided `PLAN.md`.
- Explicitly identify:
  - Core features clearly stated.
  - Dependencies explicitly defined or implied.
  - Acceptance criteria clearly documented.
  - Any implicit requirements or assumptions needing clarification.

## 2. Structure the TODO.md
- Create or update `TODO.md` explicitly in this structured format:

```markdown
# TODO

## [Feature/Section Name from PLAN.md]

- [ ] Task title (atomic and clear)
  - Explicit Description: Concise, actionable details.
  - Dependencies: Clearly stated (tasks or external requirements).
  - Priority: Explicitly defined (high, medium, low).

Repeat explicitly for each distinct task.
```

- Ensure every task is explicitly atomic (each can be implemented, tested, and verified independently).

## 2. Explicitly Prioritize Tasks
- Think carefully about the optimal sequence:
  - Clearly order tasks by priority (high-priority tasks first).
  - Explicitly highlight and resolve dependencies clearly within task ordering.

## 3. Clarify and Document
- If uncertainty or ambiguity arises during task decomposition, explicitly note this clearly and request clarification.
- Document all assumptions explicitly made during ticketing clearly at the top of `TODO.md`.

## 4. Verify and Summarize
- Explicitly cross-reference each task with `PLAN.md` to ensure comprehensive coverage.
- Clearly summarize the total number of tasks and their priority distribution at the bottom of `TODO.md`.

## Example of Ticketed Task

```markdown
- [ ] Implement user authentication
  - Explicit Description: Implement Google OAuth login flow, including login and logout functionality, aligned with security standards in DEVREF.md.
  - Dependencies: None
  - Priority: High
```

Explicitly follow this structured, reasoning-intensive process to ensure tasks are clearly defined, atomic, and actionable.
