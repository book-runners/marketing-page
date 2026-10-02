# Agent instructions: marketing-page

## Where work runs (Book Runners standard)
- Shared rules: https://github.com/book-runners/agent_repository/blob/main/START-HERE.md
- Andrew's PC is for conversation, planning, light edits, git, ruff/actionlint and ops CLIs (aws, gh, heroku, ssh). Never run test runners, builds, Rails, Docker/WSL, test browsers or Terraform plan/apply on it.
- Run checks on the workspace host: from the PC `brw check <files>`; on the host `br-workspace check <files>` (focused checks take ~20–60 s). Full suites run in hosted CI.
- Keep PRs as drafts while iterating; mark ready when a host check passes. Hosted CI on the exact head decides merges; never merge around required checks.

## Repo notes
- Static Jekyll site published by GitHub Pages from `master` (see `README.md`). Work on a branch and open a PR; never push to `master`.
- Do not build or serve the site (Jekyll, Ruby, Docker) on Andrew's PC. `.github/workflows/ci.yml` is the authoritative Pages build check; read its result instead of reproducing it locally.
- This repo is not yet in the workspace host's repository list; until `br-workspace new marketing-page <task>` works, hosted CI is the check venue. Docs and HTML/CSS edits plus git are fine on the PC.
- Jacob keeps local development on his own workstation (hub `RULES.md`); the PC restriction above is for Andrew's PC and agent environments.
