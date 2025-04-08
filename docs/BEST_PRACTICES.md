# BEST PRACTICES

Guidelines for writing maintainable, reliable, and scalable software.

1. Test-Driven Development (TDD)
	• Write failing tests first to clearly define expected behavior.
	• Keep tests small, focused, and fast.
	• Aim for meaningful, high-quality test coverage.

2. Leverage Strong Types
	• Use the strictest type settings available (e.g., TypeScript’s strict mode).
	• Avoid any or vague types; specify precise types instead.
	• Define clear, expressive type aliases and interfaces.

3. Never Disable Linting or Type Checking
	• Always resolve the root cause rather than suppressing warnings.
	• Regularly refine linting rules to match team standards.

4. Conventional Commits & Atomic Changes
	• Clearly label commits (feat, fix, refactor) for easy readability.
	• Keep commits small, self-contained, and logically grouped.
	• Provide concise commit messages explaining why changes were made.

5. Write Clean, Modular, Functional Code
	• Favor pure functions with minimal side effects.
	• Prefer immutability to simplify state management and debugging.
	• Organize code into small, composable modules.

6. Minimal & Simple Abstractions
	• Avoid premature abstraction; abstract only after clear patterns emerge.
	• Frequently reassess abstractions—complexity signals a flawed design.
	• If a reusable component accumulates too many special-case parameters:
	• Replace its usages with simpler, copied versions.
	• Later, abstract only genuinely shared functionality.

7. Pragmatic Programming Principles
	• Prioritize simplicity, readability, and ease of future changes.
	• Eliminate duplication (DRY), but avoid forced reuse that complicates logic.
	• Keep solutions straightforward (KISS); avoid overly clever implementations.
	• Anticipate likely changes but avoid speculative complexity.
	• Automate repetitive tasks (tests, formatting, setup scripts).

8. Maintainability & Readability
	• Use automated formatters (Prettier, Black) for consistent style.
	• Choose meaningful, self-descriptive names.
	• Prioritize clarity and straightforwardness over cleverness.

9. Documentation & Comments
	• Strive for self-documenting code through clear naming and structure.
	• Comment only to clarify rationale or context, not functionality.

10. Dependency Management
	• Regularly upgrade dependencies to maintain security and stability.
	• Limit external dependencies to those adding clear value.

11. Performance & Optimization
	• Avoid premature optimization; profile first to identify bottlenecks.
	• Write clear, efficient code by default, optimizing only as needed.
