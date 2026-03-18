---
name: codereview
description: Performs a codereview given on a given range of commits
allowed-tools: Read, Grep, Glob, Bash(gh *)
---

Perform codereview on the received last commits.
If not specified, focus only on the last commit.

Main focus should always be on code simplicity and readability, focus on reusing existing functions (even from well-known libraries).

Then, focus on security.

Finally, on performance.
You can always point out slow algorithm, but weight it against simplicity.

Be brief when summarizing, we will ask you for details in next prompt if need be.

Always provide a full path to the source as well as line.
