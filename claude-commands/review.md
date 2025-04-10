# REVIEW

> Execute each task in the order given to conduct a thorough code review.

## 1. Create diff.md

Create a new file called diff.md.

At the top of the file, add the following markdown:
```markdown
# Code Review Request

## Context
- Review the following code changes (`git diff` against master branch).
- **Reference the following standards documents for your review:**
  - `CORE_PRINCIPLES.md` - For foundational software design principles
  - `ARCHITECTURE_GUIDELINES.md` - For structural and architectural patterns
  - `CODING_STANDARDS.md` - For implementation-level practices and conventions
  - `TESTING_STRATEGY.md` - For test design principles and patterns
  - `DOCUMENTATION_APPROACH.md` - For documentation quality and practices

## Review Goals
- Identify potential bugs, logical errors, or deviations from requirements.
- Assess code quality (readability, maintainability, adherence to project standards).
- **Evaluate against standards:** Assess how the code adheres to our documented standards:
  - Does it embody the simplicity, modularity, and explicitness outlined in `CORE_PRINCIPLES.md`?
  - Does it follow the architectural patterns and separation of concerns in `ARCHITECTURE_GUIDELINES.md`?
  - Does it conform to the coding conventions detailed in `CODING_STANDARDS.md`?
  - Are tests simple, effective, and robust per the guidance in `TESTING_STRATEGY.md`? Do they avoid excessive mocking of internal components?
  - Is documentation clear, accurate, and focused on the "why" as recommended in `DOCUMENTATION_APPROACH.md`?
- Suggest improvements for clarity, efficiency, or adherence to best practices.
- Assess potential risks.

## Report Format
- Provide detailed feedback on specific issues found.
- Conclude with a concise markdown table summarizing:
    - Issue Description
    - Location (File:Line)
    - Suggested Solution / Improvement
    - Risk Assessment (Low/Medium/High, if applicable)

## Diff
```

# 2. Run git diff and append to diff.md
Run git diff against the master branch (or relevant base branch) and append the results to diff.md.

# 3. Ask thinktank to run the code review.
- Find the top ten most relevant files for context
- Run thinktank run --models google:gemini-2.5-pro-exp-03-25 diff.md [top-ten-relevant-files]
- Note the output directory for their reviews.
- If you encounter an error, write the full log output -- including the error -- to a logfile. Then try again.

# 4. Synthesize Code Review (CODE_REVIEW.MD)
Go to the output directory created by thinktank. Read each review. Think hard to synthesize the most important findings, comments, and especially critiques across all dimensions of our standards:

- Design principles (CORE_PRINCIPLES.md)
- Architectural patterns (ARCHITECTURE_GUIDELINES.md)
- Code quality (CODING_STANDARDS.md)
- Test quality (TESTING_STRATEGY.md)
- Documentation practices (DOCUMENTATION_APPROACH.md)

Create a single, consolidated CODE_REVIEW.MD file summarizing the findings and actionable recommendations, organizing feedback by these dimensions where relevant, and including the summary table requested in the prompt.
