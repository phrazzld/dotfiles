# REFACTOR

> Execute each task in the order given to generate a refactor plan for the codebase.

## 1. Create task.md

Create a new file called `task.md`.

Copy the content from `prompts/refactor.md` into `task.md`.

## 2. Run architect with the task file

Run the following command from the project root:

```bash
# Find the top ten most relevant files for additional context
# Run architect with all the context files
architect --instructions task.md --output REFACTOR_PLAN.md docs/philosophy/ [top-ten-relevant-files]
```

This will analyze the codebase and generate a refactor plan in `REFACTOR_PLAN.md`.

If you encounter an error, write the error to a persistent logfile. Then try again.

## 3. Read the refactor plan

Go to the `REFACTOR_PLAN.md` file and read the generated plan to understand the proposed refactoring steps and recommendations.
