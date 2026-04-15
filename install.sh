#!/usr/bin/env bash
set -e

REPO="jazzsequence/claude-write-like-a-human-skill"
SKILL_NAME="write-like-a-human"
SKILLS_DIR="$HOME/.claude/skills"
INSTALL_DIR="$SKILLS_DIR/$SKILL_NAME"
SETTINGS_FILE="$HOME/.claude/settings.json"

# Remove legacy flat file from earlier installs
if [ -f "$SKILLS_DIR/$SKILL_NAME.md" ]; then
  rm "$SKILLS_DIR/$SKILL_NAME.md"
  echo "Removed legacy flat file: $SKILLS_DIR/$SKILL_NAME.md"
fi

mkdir -p "$SKILLS_DIR"

# Clone or update
if [ -d "$INSTALL_DIR/.git" ]; then
  echo "Updating $SKILL_NAME..."
  git -C "$INSTALL_DIR" pull --ff-only
else
  [ -d "$INSTALL_DIR" ] && rm -rf "$INSTALL_DIR"
  echo "Cloning $SKILL_NAME from https://github.com/$REPO..."
  git clone "https://github.com/$REPO.git" "$INSTALL_DIR"
fi

# Register in settings.json
python3 - "$SETTINGS_FILE" "$REPO" "$SKILL_NAME" <<'PYEOF'
import json, sys, os

settings_file, repo, skill_name = sys.argv[1], sys.argv[2], sys.argv[3]

try:
    with open(settings_file) as f:
        settings = json.load(f)
except (FileNotFoundError, json.JSONDecodeError):
    settings = {}

settings.setdefault("extraKnownMarketplaces", {})[skill_name] = {
    "source": {
        "source": "github",
        "repo": repo
    }
}

with open(settings_file, "w") as f:
    json.dump(settings, f, indent=2)
    f.write("\n")

print(f"✓ Marketplace configured in {settings_file}")
PYEOF

echo "✓ Installed at $INSTALL_DIR (git-managed)"
echo ""
echo "Restart Claude Code, then invoke with /write-like-a-human"
