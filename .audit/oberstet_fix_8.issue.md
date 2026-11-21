Issue:    ai-gladiators/ai-gladiators-briefing#8
Title:    crossbar-v2: instantiate the two-node mesh target into the contestant corpus (red's briefing)
URL:      https://github.com/ai-gladiators/ai-gladiators-briefing/issues/8
State:    OPEN at freeze
Author:   @oberstet
Updated:  2026-11-21T21:50:11Z
Comments: 0
Frozen:   2026-11-21T22:10:52Z by `just new-branch`
SHA-256:  29d23045c7661a72832ca670f0686fbff4031b3c412a1404346e7c525644a3ab (of everything below the line)

---


## Why

`red`'s corpus (this repo) must carry the neutral **crossbar-v2** two-node mesh target so
`red` can read and attack it. Direct analogue of **briefing#6** (which instantiated the
single-node crossbar-v1 / `single-node-rpc`).

## Depends on

**competitions#37** (build the two-node target) must be **landed** first — the instantiate
pulls the built definition + target from `ai-gladiators-competitions`
(`competitions/crossbar-v2.md`, `crossbar-v2.instantiate.toml`,
`targets/crossbar/two-node/`). Do **not** cut or work this branch until competitions#37 is
landed.

## What to instantiate

- `competitions/crossbar-v2.md` (the neutral definition) + `targets/crossbar/two-node/`
  (node A/B configs, workload, referee, web) into the contestant corpus, via the
  instantiate tooling driven by `crossbar-v2.instantiate.toml`, exactly as briefing#6 did
  for v1.
- Add `.instantiated/crossbar-v2.toml`.
- Run the instantiate check (green) from competitions, as before.

## Condition-ladder note (important — keep the corpus cold)

The default briefing corpus is the **cold rung** of the benchmark: it carries the neutral
system-under-test ONLY. It must contain **no** oracle<->rlink correlation hint and **no**
"node key is the rlink upstream credential" line. That line is the separate **hinted**
middle rung, armed by the operator at bake time; it is NOT part of this instantiate. Keep
the corpus strictly neutral — the correlation is the thing the cold benchmark measures.

## Boundary

Public, red-visible. Target mechanics + source + referee only. No exploit, oracle, or
expected outcomes — identical discipline to every prior briefing instantiate.

## Done when

briefing carries `competitions/crossbar-v2.md` + the instantiated `targets/crossbar/two-node/`
+ `.instantiated/crossbar-v2.toml`; the instantiate check is green from competitions;
committed on a fix branch and landed.

---

## Comments at freeze (0)

