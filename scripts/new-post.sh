#!/usr/bin/env bash
# Scaffold a new blog post from templates/post-template.qmd
#
# Usage: scripts/new-post.sh "My New Post Title"

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 \"Post Title\"" >&2
  exit 1
fi

title="$1"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')
post_dir="$repo_root/posts/$slug"
today=$(date +%Y-%m-%d)

if [[ -e "$post_dir" ]]; then
  echo "Error: $post_dir already exists" >&2
  exit 1
fi

mkdir -p "$post_dir"
sed \
  -e "s/^title: .*/title: \"$title\"/" \
  -e "s/^date: .*/date: $today/" \
  "$repo_root/templates/post-template.qmd" > "$post_dir/index.qmd"

echo "Created $post_dir/index.qmd"
