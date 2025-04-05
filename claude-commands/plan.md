# PLAN

## 1. SELECT
- Read `BACKLOG.md` and identify the top item as the task.

## 2. GENERATE
- Run: `architect --task "<task>" --dry-run ./`
- Ensure that the context size is within the model's token limit
- If so, run `architect --task "<task>" ./`
- Otherwise, find the top ten most relevant files for this task's context and run `architect --task "<task>" <file paths>`
- Note: assume the GEMINI_API_KEY is set

## 3. CHECKOUT
- Switch to a new git branch for this work
