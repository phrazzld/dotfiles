Carefully read the TODO.md file and explicitly select the next highest-priority incomplete item. Clearly document the reason for your choice (priority, dependencies, risk, etc.).

Before implementing, explicitly create a structured implementation plan:
- Clearly summarize exactly what needs to be done.
- Explicitly outline your intended approach, considering:
  - Dependencies on other tasks or systems.
  - Side-effects and risks clearly identified.
  - Explicit references to relevant standards from DEVREF.md, AESTHETIC.md, ARCHITECTURE.md, CHECKLIST.md.

Think hard about the optimal implementation strategy and explicitly document your reasoning clearly in this implementation plan.

Then fully implement the solution exactly according to your plan:
- Explicitly adhere to all guidelines provided in DEVREF.md, AESTHETIC.md, ARCHITECTURE.md, CHECKLIST.md.
- Immediately verify all relevant builds, linting, and tests explicitly. Clearly document results.
- If verification fails, explicitly troubleshoot, clearly document your debugging steps, fix the issue, and verify again.

Upon successful verification:
- Explicitly mark the task as completed in TODO.md.
- Clearly document your commit message, explicitly summarizing the task and your chosen implementation strategy.

Repeat this structured process iteratively until no incomplete tasks remain in TODO.md.

If at any point uncertainty arises, explicitly pause and request clarification immediately.
