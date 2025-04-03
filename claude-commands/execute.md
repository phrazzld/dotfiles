# EXECUTE

## 1. SELECT
- Pick the highest-priority task from TODO.md

## 2. PLAN
- Summarize the task
- Outline approach
- Justify your strategy

## 3. WRITE EMPTY TESTS
- Write test assertions that the completion of this task should satisfy
- All of the functionality we need to achieve with this task should be clear from the test assertions
- Remember: Describe the observable effect to verify, **not** the method by which it's achieved!

## 4. IMPLEMENT A FAILING TEST
- Implement one of the empty tests you wrote
- Make sure it fails, since we haven't implemented actual functional code for the task yet

## 5. MAKE THE FAILING TEST PASS
- Implement the necessary functionality to make the failing test pass

## 6. REPEAT STEPS 4 AND 5 UNTIL THERE ARE NO MORE EMPTY OR FAILING TESTS
- Verify with builds, linting, and tests after each change

## 7. FINALIZE
- Mark task complete in TODO.md
- Write a clear commit message summarizing the task and approach
