## OSS Skills

This repo contains Claude slash commands and agent skills for open source
contribution workflows.

### Install

```bash
git clone https://github.com/mugiwaraluffy56/oss-skills.git
cd oss-skills

chmod +x install.sh
./install.sh
```

The installer copies:

- Claude slash commands from `commands/*.md` to `~/.claude/commands`
- Claude skills from `*/SKILL.md` to `~/.claude/skills`
- Codex-compatible skills from `*/SKILL.md` to `~/.agents/skills`

### Usage

In Claude Code, use the commands with `/`:

```text
/create-pr add a failing test for issue #123 and fix it
/comment-pr https://github.com/org/repo/pull/123 say I pushed the requested change
/lfx-research-architect issue: <upstream_issue_url> project: <lfx_project_page_url>
```

In Codex or other skill-aware agents, invoke them by skill name in chat instead
of relying on `/` command discovery.
