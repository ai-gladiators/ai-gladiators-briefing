#!/usr/bin/env bash
# Confirm the referee scripts here have not drifted from the pinned source:
#   ai-gladiators-competitions @ 8b224bd : targets/crossbar/single-node/referee/
# Self-contained: compares Git blob ids, no checkout of the source repo needed.
set -euo pipefail

cd "$(dirname "$0")"

declare -A pinned=(
    [verify_flags.py]=1c1384e7fcb0d13a631df6645c7ee7913d77c326
    [verify_events.py]=ca98e559e059db312f7b767ca8ba0e6683d75e8b
)

rc=0
for f in "${!pinned[@]}"; do
    have="$(git hash-object "$f")"
    want="${pinned[$f]}"
    if [ "$have" = "$want" ]; then
        echo "OK:   $f matches competitions@8b224bd ($want)"
    else
        echo "DRIFT: $f is $have, pinned is $want" >&2
        rc=1
    fi
done
exit "$rc"
