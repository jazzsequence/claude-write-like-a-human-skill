# write-like-a-human

A Claude Code skill that writes content in a specific human voice — mine — while actively avoiding the AI writing patterns catalogued by [Wikipedia's research on AI-generated text](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing).

The skill has two parts:

1. **Voice model** — derived from analysis of actual writing samples from [jazzsequence.com](https://jazzsequence.com): tone, sentence rhythm, signature devices (parenthetical asides, single-sentence paragraphs, honest hedging), and how technical and personal topics get handled differently.

2. **Anti-pattern checklist** — the specific vocabulary words, sentence structures, and rhetorical moves that correlate with AI generation, with concrete alternatives. This includes the AI vocabulary list (which shifts over model generations), elaborate copulative substitutes ("serves as," "stands as"), vague attribution, significance-inflation endings, and the formulaic "despite challenges, continues to thrive" closer.

## Install

**One-liner** (once this repo is public on GitHub):

```bash
curl -fsSL https://raw.githubusercontent.com/jazzsequence/claude-write-like-a-human-skill/main/install.sh | bash
```

**From a local clone:**

```bash
git clone https://github.com/jazzsequence/claude-write-like-a-human-skill.git
cd claude-write-like-a-human-skill
./install.sh
```

Both options clone the repo into `~/.claude/skills/write-like-a-human/` and register it in `~/.claude/settings.json`. Restart Claude Code after installing.

## Usage

In any Claude Code session:

```
/write-like-a-human
```

Then describe what you want written. Works in Claude Code CLI, Claude Desktop, and any IDE extension that supports slash commands.

## Updating

The Wikipedia anti-patterns list evolves as AI models change — the specific vocabulary words that flag AI output shift over model generations. Pull the latest version and re-run the installer to stay current:

```bash
git pull && ./install.sh
```

## Adapting This for Your Own Voice

The voice model section of `write-like-a-human.md` is specific to my writing. To adapt it:

1. Pull writing samples from your own published work
2. Do a style analysis: signature phrases, paragraph rhythm, how you handle transitions, relationship with the reader, verbal tics
3. Replace the "How Chris Actually Writes" section with your own patterns
4. Keep the anti-patterns section — it's model-agnostic and universally useful

The anti-patterns section is the part that will need periodic updates as AI writing evolves. The voice model section only changes if your writing does.
