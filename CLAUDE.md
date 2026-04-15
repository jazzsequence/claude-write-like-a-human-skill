# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A Claude Code skill that instructs Claude to write in Chris Reynolds' personal voice (jazzsequence.com) while avoiding AI writing anti-patterns catalogued by Wikipedia's research on AI-generated text. The skill combines a negative constraint set (what not to do) with a positive voice model (how Chris actually writes).

The primary artifact is `write-like-a-human.md` — the skill prompt file.

## Skill File Format

Claude Code skills are markdown files with YAML frontmatter:

```yaml
---
name: skill-name
description: One-line description shown in skill picker
---
```

The body is a prompt that gets injected into the conversation when the skill is invoked. Write it as direct instructions to Claude, not documentation about Claude.

## Updating the Voice Model

The writing style section of `write-like-a-human.md` is derived from analysis of posts at `next.jazzsequence.com`. When updating:

- Pull new writing samples from `next.jazzsequence.com/posts/[slug]` — the headless Next.js frontend for the site
- Do **not** use AI-written posts as style examples (e.g., the MCP integration post was written by AI)
- Look for posts where the voice is most unguarded — personal essays and opinion pieces over technical walkthroughs
- The anti-patterns section tracks Wikipedia's evolving list at `https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing` — the specific vocabulary words change as AI models evolve

## Key Design Decisions

**Why two separate sections (voice + anti-patterns)?** Positive instruction alone ("write casually") isn't specific enough. The anti-patterns section gives Claude a checklist to run against a draft before delivering it — mechanical patterns it can actually detect and eliminate.

**Why a vocabulary table instead of a prose description?** The copulative substitutes ("serves as," "stands as") are a specific, enumerable pattern. A table makes it easier to catch during self-review.

**Why not include more writing samples verbatim?** The skill prompt will be read on every invocation. Long verbatim excerpts waste context. The style analysis captures the patterns; Claude can infer the rest.

## Installing the Skill

Copy `write-like-a-human.md` to `~/.claude/skills/` to make it available as `/write-like-a-human` in Claude Code sessions.
