# DEBUG

## 1. Start
- Read `BUG.md`.
- Create `BUGFIXPLAN.md`.
- Add bug description, repro steps, expected vs. actual behavior, key components.

## 2. Guess
- List likely causes, brief reasons, and quick tests.

## 3. Test
- Split into small tasks:
  - What to test.
  - How to test.
  - Expected result.
- Log findings in `BUGFIXPLAN.md`.

## 4. Refine
- Update hypotheses with evidence.
- Repeat until root cause is found.

## 5. Fix
- Note root cause in `BUGFIXPLAN.md`.
- Apply and verify fix.
- Add inline code comments: bug, cause, fix, prevention.

## 6. Finish
- Commit with a short message + `BUGFIXPLAN.md` reference.
- If stuck, flag it and ask for help.
