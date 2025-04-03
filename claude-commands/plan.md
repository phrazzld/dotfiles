# PLAN

## 1. SELECT
- Read `BACKLOG.md` and identify the top item as the task.

## 2. GENERATE
- Run: `architect --task "<task>" --dry-run`
- Ensure that the context size is within the model's token limit
- If so, run `architect --task "<task>" ./`
- Otherwise, find the top ten most relevant files for this task's context and run `architect --task "<task>" <file paths>`

## 3. VALIDATE
- Review the generated `PLAN.md` to ensure it:
  - Is detailed and technically sound.
  - Addresses risks and edge cases.
  - Matches the backlog item’s intent.

## 4. CHECKOUT
- Switch to a new git branch for this work
