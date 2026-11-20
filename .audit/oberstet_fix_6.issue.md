Issue:    ai-gladiators/ai-gladiators-briefing#6
Title:    Materialize crossbar-v1 (single-node PubSub+RPC) into the contestant corpus
URL:      https://github.com/ai-gladiators/ai-gladiators-briefing/issues/6
State:    OPEN at freeze
Author:   @oberstet
Updated:  2026-11-20T22:51:32Z
Comments: 0
Frozen:   2026-11-20T23:06:52Z by `just new-branch`
SHA-256:  1e505965384d0a082cac2902c676707e666132fe1b6a1c5ec5522f968faffbdb (of everything below the line)

---


## Why

`ai-gladiators-briefing` is the contestant corpus — the only ai-gladiators repo `red`
is handed. The single-node PubSub+RPC target `crossbar-v1` is now source-of-truth in
`ai-gladiators-competitions` (competitions#33, landed). This copies it here via the
`instantiate` mechanism (competitions#30), the same step briefing#3 did for `crossbar-v0`.

## What

From the competitions clone, against this briefing checkout:

```
just instantiate crossbar-v1 ../ai-gladiators-briefing
```

That copies the `crossbar-v1` allowlist (`competitions/crossbar-v1.instantiate.toml`)
and writes provenance to `.instantiated/crossbar-v1.toml`, staged, not committed. This
issue's branch is where it lands.

### Deliverables (the staged set)

- `competitions/crossbar-v1.md` — the single-node PubSub+RPC competition definition.
- `targets/crossbar/single-node-rpc/` — the router config, the reworked client
  (exact-URI, flag-bearing `echo`, probe canaries), the smoke harness + rogue
  injector, web, and the per-target `referee/` (`verify_flags.py`, `verify_events.py`,
  `verify_calls.py`).
- `.instantiated/crossbar-v1.toml` — provenance (source commit + per-file blob ids).

### Heads-up: this overwrites a stale file (intentional)

briefing#1 hand-wrote a **two-node** `competitions/crossbar-v1.md` and a **top-level**
`referee/`. Under the competition renumber (v0 → v1 single-node → v2 two-node), that
two-node content is now **`crossbar-v2`** material. This instantiate **overwrites**
`competitions/crossbar-v1.md` with the single-node definition — correct and intended;
the two-node definition returns as `crossbar-v2.md` in the v2 instantiate.

The orphaned **top-level `referee/`** (briefing#1, two-node) is **left as-is here** —
it is reconciled in the v2 instantiate (where the two-node target lands with its own
per-target referee). Out of scope for this issue beyond noting it. (`crossbar-v1`'s
own referee lives per-target at `targets/crossbar/single-node-rpc/referee/`.)

### Land

Cut this branch, run the recipe, **review the public diff** (the allowlist is the
boundary, the review is the backstop — confirm no key material and no flag values),
then land. It is a content change (no `.ai`/`.cicd`), so `just land` applies.

## Verify

After landing, from the competitions clone:

```
just instantiate-check crossbar-v1 ../ai-gladiators-briefing
```

Expected: every file `OK`, provenance cites the competitions commit it came from.

## Sequencing

Mirror of briefing#3 (v0), one version on. The two-node `crossbar-v2` instantiate
(the re-scoped `briefing#5`) follows after the v2 target is built, and reconciles the
top-level `referee/` then.

---

## Comments at freeze (0)

