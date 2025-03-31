# AUDIT

## 1. Initialize Audit Document
- Create SECURITY_AUDIT.md to log findings, hypotheses, and areas for deeper investigation.

## 2. Exploratory Review
- Systematically investigate codebase for potential issues:
  - Authentication & authorization logic.
  - Input handling, validation, and sanitization.
  - Session management, cookies, and tokens.
  - Data encryption (in transit/at rest).
  - Error handling and sensitive data exposure.
  - Third-party libraries and dependencies.
  - Infrastructure and configuration files.
  - Known security anti-patterns (OWASP Top 10).
  - Other potential security issues discovered during exploration.

## 3. Document Progressively
- In SECURITY_AUDIT.md, continuously log:
  - Potential vulnerabilities or security concerns.
  - Code snippets and affected components.
  - Initial severity estimations.
  - Areas flagged for deeper analysis.

## 4. Deep-Dive Analysis
- For promising leads:
  - Conduct focused, detailed code inspection.
  - Verify risks through logical analysis or available tooling.
  - Update SECURITY_AUDIT.md with confirmed findings, impact assessments, and evidence.

## 5. Synthesize Action Plan
- Convert findings into a technical action plan (PLAN.md) including:
  - Clearly defined issues and their impacts.
  - Detailed technical steps for resolution.
  - Recommended secure patterns or example fixes.
  - Acceptance criteria and verification procedures.

## 6. Finalize
- Commit PLAN.md summarizing vulnerabilities, required actions, and detailed implementation strategy.
