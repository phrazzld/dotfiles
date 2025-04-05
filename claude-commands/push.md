# PUSH
## 1. FINAL LINT VALIDATION
- **Goal:** Ensure the complete current codebase state adheres to linting standards.
- **Action:** Run the project linter across the entire relevant codebase. If *any* issues are reported (even if introduced by merging/rebasing), you *must* fix them. No bypasses allowed.

## 2. FINAL BUILD VALIDATION
- **Goal:** Confirm the project builds successfully with all current changes integrated.
- **Action:** Execute the project's build process. If *any* build errors occur, you *must* investigate and resolve them.

## 3. FINAL TEST VALIDATION
- **Goal:** Verify that all project tests pass with the current integrated codebase.
- **Action:** Run the complete test suite. If *any* tests fail, you *must* investigate and fix the underlying issues (either in the code or the tests).

## 4. SYNCHRONIZE & PUSH
- **Goal:** Ensure the local branch is up-to-date and push committed changes to the remote repository.
- **Actions:**
    - **Identify Branch:** Determine the current local Git branch name.
    - **Fetch Updates:** Fetch the latest changes from the primary remote repository (`git fetch origin` or equivalent).
    - **Check Status:** Compare the local branch commit history with its corresponding remote tracking branch (e.g., `origin/<current-branch-name>`).
        - If the local branch is behind the remote, report this state clearly and **stop**. Manual intervention (e.g., `git pull --rebase` or `git merge`) is required by the user.
        - If the local branch is ahead of or identical to the remote (and not diverged in complex ways), proceed.
    - **Execute Push:** Push the current local branch to its corresponding upstream branch on the primary remote (e.g., `git push origin HEAD`).
    - **Handle Push Errors:** If the `git push` command fails (e.g., due to newly discovered conflicts, permissions, hooks), report the specific error message clearly and **stop**. Manual intervention is required.
    - **Confirm Success:** If the push completes without error, report "Push successful for branch <current-branch-name>."
