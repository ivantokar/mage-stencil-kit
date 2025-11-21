#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ $# -ne 1 ]]; then
  echo "Usage: scripts/bump-version.sh <new-version>" >&2
  exit 1
fi

NEW_VERSION="$1"

if [[ ! "$NEW_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Error: version must be in MAJOR.MINOR.PATCH form (e.g., 1.2.0)." >&2
  exit 1
fi

cd "$ROOT_DIR"

printf '%s\n' "$NEW_VERSION" > VERSION

cat <<EOF
Updated version to $NEW_VERSION.

Next steps:
  1. Run tests: swift test
  2. Commit the changes and tag the release (e.g., git tag v$NEW_VERSION)
  3. Push the tag: git push origin v$NEW_VERSION
EOF
