# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Wu (Workstation Utils) is a personal developer utility collection for macOS/zsh. It contains shell functions (sourced into the shell) and a Go CLI tool.

## Build & Install

### randgen (Go CLI)

```shell
cd generators/randgen && go build -o ~/.local/bin/randgen .
```

There are no tests or linters configured. The Go module is at `generators/randgen/go.mod` (module name: `randgen`).

### Shell scripts

Shell scripts in `git-remote/` are sourced directly — no build step.

## Architecture

- **generators/randgen/** — Go CLI (cobra) for generating random strings, passwords, and UUIDs. Uses `crypto/rand` for secure randomness. UUID v4/v7 are implemented without external libraries. Structure: `cmd/` (cobra commands), `gen/` (generation logic), `clip/` (clipboard via `pbcopy`).
- **git-remote/** — Shell functions for cloning repos (`gcr`), navigating to local clones (`cr`), and GitLab integration (`gissue`, `gepic`, `gproject_id`). GitLab functions require `GITLAB_SERVER_URL`, `GITLAB_API_TOKEN`, `ISSUES_PROJECT_ID`, `EPICS_GROUP_ID` env vars and `jq`/`curl`/`mdless` dependencies.

## Conventions

- Random/crypto code must use `crypto/rand`, never `math/rand`.
- The randgen CLI avoids external UUID libraries — v4 and v7 are implemented directly in `gen/uuid.go`.
- Shell functions use lowercase-with-hyphens naming (e.g., `git-remote-to-local`, `docker-cleanup`).
- Go code follows standard cobra patterns: each subcommand in its own file under `cmd/`, shared helpers in `cmd/root.go`.
