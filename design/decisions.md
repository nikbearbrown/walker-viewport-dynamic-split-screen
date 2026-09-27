# Open questions log — walker-viewport-dynamic-split-screen

Gate — unsigned at time of writing. Written by `/gdd reverse --path godot silent`, 2026-09-27. Every `[MISSING]` in `GDD.md` is an entry here.

Format: THE QUESTION / THE STAKES / DECISION DEADLINE / OPTIONS / OWNER / STATUS. Status is Open, In Discussion, or Decided.

| # | Question | Stakes | Deadline | Options | Owner | Status |
|---|---|---|---|---|---|---|
| Q-01 | What is this demo for in Walker? | No definition of done; Ghost Center stays permanent | before further work or film | (a) film source only; (b) split-screen camera component for a Walker co-op game; (c) course example | Nik Bear Brown | Open |
| Q-02 | Who is the audience, and what should they see? | Replaces PX goals; decides the film's shot list | with Q-01 | developer / student / reference copy only | Nik Bear Brown | Open |
| Q-03 | Stay a demo, or seed a two-player game? | If a game, a person writes the Vision layer (`/gdd v1`); Zelda will not invent one | with Q-01 | demo / game / undecided | Nik Bear Brown | Open |
| Q-04 | If it becomes a game: what do the two players do together? | Movement without a goal is not a game; every later section depends on this | only if Q-03 = game | co-op objective / competitive / exploration | Nik Bear Brown | Open |
| Q-05 | What counts as visual verification of the split? | Fixture checks set positions directly; nobody has seen a split (R-01, R-02) | before the films | input-driven test T-07 + GPU capture T-08; human session H-01 | Nik Bear Brown | Open |
| Q-06 | Definition of done for the two pending native-4K Liam films | Blocked on visible capture; FRICTIONAL.md requires genuine input-driven capture before any review-ready claim | when the capture constraint clears | shot list: together → apart → diagonal split → together | Nik Bear Brown | Open |
| Q-07 | CORE is 3/10 = 30% | Under the 40% limit; no action needed | none | accept | Nik Bear Brown | Open (recorded for completeness) |
| Q-08 | `wall_coloring.gd` is not attached. Was random wall colour intended? | A film or text may describe colours that the scene does not produce | before the films | leave unattached (upstream as shipped); attach in a Walker fork outside `godot/`; document only | Nik Bear Brown | Open |
| Q-09 | Gamepad device 0 drives P1 (left stick) and P2 (right stick) | One controller moves both players; device 1 also drives P2 | before any controller claim | keep upstream mapping; split by device; document only | Nik Bear Brown | Open |
| Q-10 | Is the movement feel (≈18 units/s steady, 0.9 friction per tick at 120 Hz) acceptable for a 10-unit split threshold? | Split may flicker in normal play (R-03) | after H-01 | keep upstream tuning; retune in a fork | Nik Bear Brown | Open |
