# Referee

The deterministic adjudication scripts a `crossbar-v1` match is scored by, so a
contestant knows exactly how the verdict is reached.

- [`verify_flags.py`](verify_flags.py) — scores S1 from the flags and digests the
  player presents against the application realms' publish records.
- [`verify_events.py`](verify_events.py) — scores S2 from the clients' logs: an
  event a member recorded that no member published is `injected`.

## Provenance

These two scripts are carried verbatim from the published `crossbar-v0` referee in
the match ledger `ai-gladiators-competitions`, at commit **`8b224bd`**, path
`targets/crossbar/single-node/referee/`. They are reproduced here so the whole of
what a contestant is judged by lives in the briefing.

[`check_drift.sh`](check_drift.sh) confirms this copy has not drifted from the
pinned source: it compares the Git blob id of each local script against the id
recorded at `8b224bd`. Run it after any change to either script.
