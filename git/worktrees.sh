#!/usr/bin/env bash

function gclw() {
    local worktree_paths wt

    # Return immediately if not in a git repository
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Error: Not a git repository."
        return 1
    fi

    echo "Fetching additional worktrees..."

    # Get all worktree paths except the first one (the main/bare repository root)
    # 'git worktree list --porcelain' outputs structured data where 'worktree <path>' starts each entry.
    worktree_paths=$(git worktree list --porcelain | sed -n 's/^worktree //p' | tail -n +2)

    if [ -z "$worktree_paths" ]; then
        echo "No additional worktrees found to remove."
        return 0
    fi

    echo "The following worktrees will be removed:"
    echo "$worktree_paths"
    echo "----------------------------------------"

    # Loop through and remove each worktree
    # Use --force if you want to bypass uncommitted changes check (optional)
    while IFS= read -r wt; do
        if [ -n "$wt" ]; then
            echo "Removing worktree: $wt"
            git worktree remove "$wt" --force
        fi
    done <<< "$worktree_paths"

    # Clean up stale worktree administrative files
    echo "Pruning worktree metadata..."
    git worktree prune

    echo "Done! All non-main worktrees have been cleaned up."
}
