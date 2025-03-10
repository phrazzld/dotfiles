# Deep Research Prompter

```
here's the openai blogpost describing deep research:
"""
Introducing Deep Research | OpenAI

February 2, 2025

Introducing Deep Research

Today we're launching Deep Research in ChatGPT, a new agentic capability that conducts multi-step research on the internet for complex tasks. It accomplishes in minutes what would take a human many hours.

Deep Research is OpenAI's next agent that works independently—you provide a prompt, and ChatGPT will find, analyze, and synthesize hundreds of online sources to create a comprehensive report at the level of a research analyst. Powered by a version of the upcoming OpenAI o3 model optimized for web browsing and data analysis, it leverages reasoning to search, interpret, and analyze massive amounts of text, images, and PDFs on the internet, pivoting as needed in reaction to information it encounters.

The ability to synthesize knowledge is a prerequisite for creating new knowledge. For this reason, Deep Research marks a significant step toward AGI, which we have long envisioned as capable of producing novel scientific research.

Why We Built Deep Research

Deep Research is built for people who do intensive knowledge work in areas like finance, science, policy, and engineering and need thorough, precise, and reliable research. It can be equally useful for discerning shoppers looking for hyper-personalized recommendations on cars, appliances, and furniture.

Every output is fully documented, with clear citations and a summary of its thinking, making it easy to reference and verify information. It is particularly effective at finding niche, non-intuitive information that would require browsing numerous websites. Deep Research frees up valuable time by allowing you to offload and expedite complex, time-intensive web research with just one query.

Deep Research independently discovers, reasons about, and consolidates insights from across the web. To accomplish this, it was trained on real-world tasks requiring browser and Python tool use, using the same reinforcement learning methods behind OpenAI o1, our first reasoning model. While o1 demonstrates impressive capabilities in coding, math, and other technical domains, many real-world challenges demand extensive context and information gathering from diverse online sources. Deep Research builds on these reasoning capabilities to bridge that gap, allowing it to take on the types of problems people face in work and everyday life.

How to Use Deep Research

In ChatGPT, select 'Deep Research' in the message composer and enter your query. Tell ChatGPT what you need—whether it's a competitive analysis on streaming platforms or a personalized report on the best commuter bike. You can attach files or spreadsheets to add context to your question.

Once it starts running, a sidebar appears with a summary of the steps taken and sources used.

Deep Research may take 5 to 30 minutes to complete its work, taking the time needed to dive deep into the web. In the meantime, you can step away or work on other tasks—you'll get a notification once the research is complete. The final output arrives as a report within the chat. In the next few weeks, we will also be adding embedded images, data visualizations, and other analytic outputs in these reports for additional clarity and context.

Compared to GPT-4o, which is ideal for real-time, multimodal conversations, Deep Research is designed for multi-faceted, domain-specific inquiries where depth and detail are critical. It conducts extensive exploration and cites each claim, offering a well-documented, verified answer that can be used as a work product.

Real-World Use Cases

Deep Research can handle complex, multi-step research across a wide range of topics, including:
	•	Business Analysis: Conduct a competitive analysis on global streaming platforms, evaluating trends, market positioning, and pricing strategies.
	•	Medical Research: Compile an in-depth review of clinical trials on novel gene therapies, including FDA approvals and efficacy data.
	•	UX Design: Gather usability studies on button design, comparing the effectiveness of icons vs. text labels.
	•	Shopping & Consumer Insights: Recommend the best all-mountain snowboard for powder conditions in Hokkaido, Japan, incorporating availability and pricing.
	•	General Knowledge: Find historical TV show episodes based on vague user descriptions, searching for exact matches across multiple sources.

Deep Research responds to ambiguous, multi-part queries by persistently searching until it finds an answer that exactly matches the criteria.

How It Works

Deep Research was trained using end-to-end reinforcement learning on complex browsing and reasoning tasks across a range of domains. Through that training, it learned to plan and execute a multi-step trajectory to find the data it needs, backtracking and reacting to real-time information where necessary.

Capabilities:
	•	Accesses & analyzes the open web
	•	Searches across uploaded files
	•	Plots and iterates on graphs using Python
	•	Embeds generated graphs & images from websites in responses
	•	Cites specific sentences or passages from sources

As a result, it reaches new highs on several public evaluations focused on real-world problem-solving.

Performance Benchmarks:

On Humanity's Last Exam, a new evaluation testing AI on expert-level questions across 100+ subjects, Deep Research achieved 26.6% accuracy, far surpassing previous models.

Model	Accuracy (%)
GPT-4o	3.3%
Grok-2	3.8%
Claude 3.5 Sonnet	4.3%
Gemini Thinking	6.2%
OpenAI o1	9.1%
DeepSeek-R1*	9.4%
OpenAI o3-mini (medium)*	10.5%
OpenAI deep research**	26.6%

Limitations

Deep Research unlocks significant new capabilities, but it still has limitations:
	•	Can sometimes hallucinate facts or make incorrect inferences
	•	May struggle with distinguishing authoritative sources from rumors
	•	Confidence calibration needs improvement, as it can fail to convey uncertainty accurately
	•	Minor formatting errors in reports and citations
	•	Longer execution times for complex queries

These issues will rapidly improve with further usage and refinement.

Access & Availability

Deep Research is currently compute-intensive. The longer it takes to research a query, the more inference compute is required.
	•	Available today for Pro users (100 queries per month)
	•	Rolling out next to Plus and Team users
	•	Enterprise version to follow

We are also working on a faster, more cost-effective version powered by a smaller model that still provides high-quality results.

Regional Availability

Deep Research is currently unavailable in the United Kingdom, Switzerland, and the European Economic Area, but we anticipate expanding access in the coming months.

What's Next?

Deep Research is available today on ChatGPT web and will roll out to mobile and desktop apps within the month.

In the future, it will be able to connect to specialized data sources, such as subscription-based or internal company databases, making its output even more robust and personalized.

Looking ahead, we envision agentic experiences in ChatGPT where Deep Research (for online investigation) and Operator (for real-world execution) will work together, enabling ChatGPT to carry out increasingly sophisticated tasks for you.

Updates & Future Expansions

February 5, 2025:
	•	Deep Research now available to Pro users in the United Kingdom, Switzerland, and EEA.

February 3, 2025:
	•	Additional safety testing and governance reviews have been conducted on o3, identifying it as Medium risk.
	•	Mitigations added to improve browsing safety.
	•	A system card outlining safety measures will be published when access expands to Plus users.

Deep Research is now live in ChatGPT for Pro users. Try it today.
"""

write a prompt for deep research that addresses the following points, comments, questions, and curiosities.
<stuff here>
```