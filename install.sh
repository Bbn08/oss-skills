#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="${1:-.}"

CLAUDE_COMMANDS="$HOME/.claude/commands"
CLAUDE_SKILLS="$HOME/.claude/skills"
CODEX_SKILLS="$HOME/.agents/skills"

echo "Installing OSS commands from: $REPO_DIR"
echo ""

mkdir -p "$CLAUDE_COMMANDS"
mkdir -p "$CLAUDE_SKILLS"
mkdir -p "$CODEX_SKILLS"

FOUND=0

if [ -d "$REPO_DIR/commands" ]; then
  find "$REPO_DIR/commands" -type f -name "*.md" | while read -r command_file; do
    command_name="$(basename "$command_file")"

    echo "Installing command: /${command_name%.md}"

    cp "$command_file" "$CLAUDE_COMMANDS/$command_name"

    echo "  Claude command: $CLAUDE_COMMANDS/$command_name"
    echo ""

    FOUND=1
  done
fi

find "$REPO_DIR" -type f -name "SKILL.md" | while read -r skill_file; do
  skill_dir="$(dirname "$skill_file")"
  skill_name="$(basename "$skill_dir")"

  echo "Installing skill: $skill_name"

  mkdir -p "$CLAUDE_SKILLS/$skill_name"
  mkdir -p "$CODEX_SKILLS/$skill_name"

  cp "$skill_file" "$CLAUDE_SKILLS/$skill_name/SKILL.md"
  cp "$skill_file" "$CODEX_SKILLS/$skill_name/SKILL.md"

  echo "  Claude: $CLAUDE_SKILLS/$skill_name/SKILL.md"
  echo "  Codex:  $CODEX_SKILLS/$skill_name/SKILL.md"
  echo ""

  FOUND=1
done

echo "Done."
