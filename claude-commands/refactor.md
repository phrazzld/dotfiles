# REFACTOR

> Execute each task in the order given to generate a refactor plan for the codebase.

## 1. Create task.md

Create a new file called `task.md`.

Add the following content to `task.md`:

```markdown
# Refactor Task

Analyze the entire codebase and provide a detailed plan for refactoring it to achieve the following goals:

- Improve simplicity and readability of the code.
- Enhance maintainability.
- Reduce the size of the codebase where possible, without sacrificing functionality or readability.
- Break up large files (approaching or exceeding 1000 lines) into smaller, more focused modules.
- Ensure that 100% of the existing functionality is maintained.

The plan should include:

- An overview of the current codebase structure and any areas that particularly need refactoring.
- A breakdown of specific refactoring tasks, such as removing duplicate code, improving naming conventions, restructuring modules, and splitting large files (>1000 lines) into smaller components.
- Implementation details for complex refactoring tasks, possibly with code snippets or examples.
- Potential challenges or risks associated with the refactoring, and how to mitigate them.
- A testing strategy to ensure that functionality remains intact after refactoring.
- Any open questions or areas that need further clarification before proceeding.
```

## 2. Run architect with the task file

Run the following command from the project root:

```bash
# First find the top ten most relevant files for context
# Then run architect with the identified context
architect --instructions task.md [top-ten-relevant-files] --output REFACTOR_PLAN.md
```

This will analyze the codebase and generate a refactor plan in `REFACTOR_PLAN.md`.

If you encounter an error, write the error to a persistent logfile. Then try again.

## 3. Read the refactor plan

Go to the `REFACTOR_PLAN.md` file and read the generated plan to understand the proposed refactoring steps and recommendations.
