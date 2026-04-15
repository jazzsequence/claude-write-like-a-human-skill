#!/usr/bin/env bash
set -e

SKILLS_DIR="$HOME/.claude/skills"
SKILL_FILE="write-like-a-human.md"

mkdir -p "$SKILLS_DIR"
cp "$SKILL_FILE" "$SKILLS_DIR/$SKILL_FILE"
echo "Installed: $SKILLS_DIR/$SKILL_FILE"
echo "Invoke with /write-like-a-human in any Claude Code session."
