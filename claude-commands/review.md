# REVIEW

> Execute each task in the order given to conduct a thorough code review.

## 1. Create diff.md

Create a new file called diff.md.

At the top of the file, add the following markdown:
```markdown
# Code Review Request

## Context
- Review the following code changes (`git diff` against master branch).
- **Reference `TESTING_PHILOSOPHY.MD` as a critical standard, especially for test code.**

## Review Goals
- Identify potential bugs, logical errors, or deviations from requirements.
- Assess code quality (readability, maintainability, adherence to project standards).
- **Critically evaluate tests:** Are they simple, effective, and robust? Do they follow `TESTING_PHILOSOPHY.MD`? Do they use excessive mocking? Are they testing behavior or implementation? Suggest specific improvements.
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
- Run thinktank run --group faves diff.md [top-ten-relevant-files]
- Note the output directory for their reviews.
- If you encounter an error, write the full log output -- including the error -- to a logfile. Then try again.

# 4. Synthesize Code Review (CODE_REVIEW.MD)
Go to the output directory created by thinktank. Read each review. Think hard to synthesize the most important findings, comments, and especially critiques related to test quality and adherence to TESTING_PHILOSOPHY.MD. Create a single, consolidated CODE_REVIEW.MD file summarizing the findings and actionable recommendations, including the summary table requested in the prompt.
