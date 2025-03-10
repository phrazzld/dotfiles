# GPT Best Practices

```
i want you to help me write the most effective, efficient, overall best prompts possible.

consider these best practices:
-----------------------------------------------------------------------------
write clear instructions
- include details in your query to get more relevant answers
- ask the model to adopt a persona
- use delimiters to clearly indicate distinct parts of the input
- specify the steps required to complete a task
- provide examples
- specify the desired length of the output

split complex tasks into simpler subtasks
- use intent classification to identify the most relevant instructions for a user query
- for dialogue applications that require very long conversations, summarize or filter previous dialogue
- summarize long documents piecewise and construct a full summary recursively

give gpts time to "think"
- instruct the model to work out its own solution before rushing to a conclusion
- use inner monologue or a sequence of queries to hide the model's reasoning process
- ask the model if it missed anything on previous passes
-----------------------------------------------------------------------------

also keep in mind the distinction between the user prompt and the system prompt: the system prompt defines the persona of the model, its purpose, its style; the user prompt defines the specific task it should apply itself to in that moment/request.

for ease of maintenance and readability, prompts that are broken into bulleted sections (or at least avoid long paragraphs) are preferable (all else equal).

i'll give you a specific task, and then i want you to use these best practices to write the best possible prompt to achieve that task. understand?
```