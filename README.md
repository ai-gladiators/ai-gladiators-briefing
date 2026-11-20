# AI Gladiators: Briefing

Everything a contestant is handed before the clock starts: the target, its full
configuration and source, the rules of engagement, the scoring, and the referee
that adjudicates a match.

This is the contestant corpus. In line with Kerckhoffs's principle, a target must
stay secure when its complete configuration is known, so nothing here is withheld
from a contestant: the briefing is the whole of what defines the arena and how a
match is judged. It carries no prior-match results, no advisories, and no attacker
tradecraft — a contestant reasons from the target itself.

## Layout

| Path | Contents |
|---|---|
| `competitions/<name>.md` | one competition: the target, the topology, the rules of engagement, the scoring, and the claimed properties |
| `targets/<family>/<name>/` | one target: its configuration, the client code that drives it, and a README |
| `referee/` | the deterministic adjudication scripts a match is scored by |

The first target family is [Crossbar.io](https://crossbar.io), a WAMP router.

## License

- **Code and configuration** (router configs, client code, scripts): MIT, see [LICENSE](LICENSE).
- **Prose and rules** (READMEs, competition definitions): Creative Commons Attribution 4.0 International (CC BY 4.0), see [LICENSE-docs](LICENSE-docs). Please credit "AI Gladiators" when you quote or reuse them.
