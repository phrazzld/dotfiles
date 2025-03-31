# ARCHITECT

## 1. Define Task
- Clearly state the primary goal, feature request, or problem that requires a technical plan.

## 2. Select Context
- Based on the defined task, identify the **most relevant** files and directories within the project.
- Prioritize files related to the core logic, data structures, interfaces, or areas likely to change.
- List the selected paths to be used as input for the `architect` tool.

## 3. Generate Plan
- Execute the `architect` command in the terminal:
  ```bash
  architect --task "YOUR_TASK_DESCRIPTION" <selected_path_1> <selected_path_2> ...
