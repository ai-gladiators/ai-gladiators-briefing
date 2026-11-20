Issue:    ai-gladiators/ai-gladiators-briefing#3
Title:    Materialize crossbar-v0 into the contestant corpus (instantiate from competitions)
URL:      https://github.com/ai-gladiators/ai-gladiators-briefing/issues/3
State:    OPEN at freeze
Author:   @oberstet
Updated:  2026-11-20T15:52:21Z
Comments: 0
Frozen:   2026-11-20T15:55:48Z by `just new-branch`
SHA-256:  9b1b7bdae6579338b517a8f9b430b4508a86c9a16279c0b69849e30f2064bb24 (of everything below the line)

---


## Why

`ai-gladiators-briefing` is the contestant corpus — the only ai-gladiators repo
`red` is handed. The crossbar-v0 target lives source-of-truth in
`ai-gladiators-competitions`; this issue copies it here so v0 is cold-runnable
under the clean-room corpus rules, using the `instantiate` mechanism
(competitions#30). This is the worked example that proves the pipeline end-to-end.

## What

From the competitions clone, against this briefing checkout:

```
just instantiate crossbar-v0 ../ai-gladiators-briefing
```

That copies the crossbar-v0 allowlist (`competitions/crossbar-v0.instantiate.toml`)
— 12 files — and writes provenance to `.instantiated/crossbar-v0.toml`, staged, not
committed. This issue's branch is where it lands.

### Deliverables (the staged set)

- `competitions/crossbar-v0.md` — the competition definition.
- `targets/crossbar/single-node/` — the router config, client, smoke harness, web, README.
- `targets/crossbar/single-node/referee/` — `verify_flags.py`, `verify_events.py`.
- `.instantiated/crossbar-v0.toml` — provenance (source commit + per-file blob ids).

### Land

Cut this branch, run the recipe, **review the public diff** (the allowlist is the
boundary, the review is the backstop), then land. It is a content change (no
`.ai`/`.cicd`), so `just land` applies.

## Verify

After landing, from the competitions clone:

```
just instantiate-check crossbar-v0 ../ai-gladiators-briefing
```

Expected: every file `OK`, provenance cites the competitions commit it came from.

## Reconcile: referee home

v0 instantiates its referee at `targets/crossbar/single-node/referee/` (per-target,
mirroring competitions). briefing#1 already placed a **top-level** `referee/` for
crossbar-v1. Two homes is acceptable for now; settle per-target vs shared when the
crossbar-v1 two-node target is built, and update `competitions/crossbar-v1.md`'s
referee links accordingly. Out of scope here beyond noting it.

---

## Comments at freeze (0)

