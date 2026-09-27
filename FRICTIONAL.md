# Verification and friction — 2026-09-26 21:36 UTC heartbeat

Read README, project, all scripts and full shader; inspected scene resources,
camera/player structure and wall geometry (scene output narrowly truncated).
No source viewport AGENTS.md found. Target absent and no active workers before
copy. Local title-only runtime adaptation; added diagnostic, source untouched.

Godot 4.7.2 import and 120-frame runtime exit 0 without observed errors.
split-20260926.log passes 18 assertions: D/L key events move both actual players
through their physics handlers; five explicitly positioned static fixtures
at separations 0/10/15/20/5 verify split flag, adaptive thickness and camera
positions; resizing the root updates both subviewport dimensions. Fixtures
disable player physics and set positions directly: they are NOT input-driven
gameplay or usable footage. No runtime fix needed.

No shader pixels were inspected. Diagonal split orientation, seam appearance,
collision routes, controller input and frame-rate behavior remain unverified.
Both films pending existing visible-capture constraint after user window closure.
No visible window reopened, fabricated film or human approval. Proceed next
feasible item without retiring pair; return for genuine input-driven capture
and required film skills before any review-ready claim.
