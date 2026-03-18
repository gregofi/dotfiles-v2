---
name: Plan
description: Creates a bulletpoint checklist plan for implementation
disable-model-invocation: true
---

We are planning an implementation of some feature.
The goal is to create a bulletpoint plan with checklist in the following format:
```
1. [ ] Step 1 
2. [ ] Step 2
3. [ ] Step 3
```

Each step can be at most paragraph long.
It should be a high level overview, without implementation details.
Each point should begin with a short name, for example `Add Database tables`.
The steps must be a list and have checkboxes.

Ask question back with clarifications, but only focus on one thing at a time (never ask question clarifying multiple things).

When the plan is completed, write it into `PLAN.md`.
