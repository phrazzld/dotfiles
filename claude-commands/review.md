# REVIEW

> Execute each task in the order given to conduct a thorough code review.

## 1. Create diff.md

Create a new file called diff.md.

At the top of the file, add the following markdown:
```markdown
# Code Review
- Review the diff, report on issues, bugs, and improvements.
- End with a concise markdown table of any issues found, their solutions, and a risk assessment for each issue if applicable

## Diff

```

## 2. Run `git diff` and append to diff.md

Run `git diff` against the master branch and append the results to diff.md.

## 3. Ask thinktank to run the code review.

Use the `thinktank` cli's default group and the diff.md file as the prompt. Specify the output directory for their reviews.

## 4. Read the reviews.

Go to the output directory created by the thinktank invocation and read each of the code reviews. Think hard about each of their key points and the most important findings and comments from each. Then synthesize them into one new top-level CODE_REVIEW.md file.
