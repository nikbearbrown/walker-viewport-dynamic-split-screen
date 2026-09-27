# Walker — Dynamic Split Screen

This is Walker's independent, title-only copy of the official Godot demo `viewport/dynamic_split_screen`. Two players share one screen while close together; when they move apart, the screen splits along a line that follows their relative position (a "Voronoi" split), composited by a shader from two camera viewports. It is a camera/shader tech demo, not a game: the players can move and collide with walls, but there is no objective, score or end state. It sits in Walker as a partly verified local adaptation with two native-4K Liam films pending and a recovered design package; its wider purpose in Walker is an open question (`design/decisions.md` Q-01). What has been found: import, runtime and 18 headless assertions pass. The tests separate input-driven movement from static camera-boundary fixtures, and neither is captured gameplay. Rendered split behaviour and both films remain pending.

## How to run

1. Open `godot/project.godot` in Godot 4.7 (the logs record 4.7.2.stable). The main scene is `godot/split_screen.tscn`.
2. Controls:
   - **Player 1 (red):** W A S D, or gamepad device 0 left stick.
   - **Player 2 (blue):** I J K L or the arrow keys, or gamepad device 0 right stick, or gamepad device 1 left stick.
   - Walk the players more than 10 units apart to split the screen.

Gamepad input has not been verified in Walker.

## Design

- [`GDD.md`](GDD.md): recovered design document (identical copy of `design/GDD.md`).
- [`design/DECK.html`](design/DECK.html): review slides.
- [`design/IMPLEMENTATION-MAP.md`](design/IMPLEMENTATION-MAP.md): feature → scene/script/line, full input map.
- [`design/decisions.md`](design/decisions.md): open questions (purpose, demo or game, the unattached `wall_coloring.gd`, the shared gamepad device, movement feel).

The GDD is a recovered, unapproved description of what the code does, written by `/gdd reverse` in silent mode. No design gate is signed, and it does not invent a goal for the players.

## Source & license

Independent title-only copy of Godot `viewport/dynamic_split_screen`, commit `a3b5c113112f77291d5f3d1360f33a882fdc52f7`. Source assets, UIDs, scripts, shader and attribution retained; the upstream MIT license is copied to `LICENSE.md`. The shader's original distance-to-line attribution link is preserved. Local title-only runtime adaptation plus an added diagnostic (`godot/test_split.gd`); source untouched.

## Status

- Godot 4.7.2 import and 120-frame runtime exit 0 without observed errors.
- `split-20260926.log` passes 18 assertions. D/L key events move both actual players through their physics handlers. Five explicitly positioned static fixtures at separations 0/10/15/20/5 verify the split flag, adaptive thickness and camera positions. Resizing the root updates both subviewport dimensions. The fixtures disable player physics and set positions directly: they are not input-driven gameplay or usable footage. No runtime fix was needed.
- Not verified: shader pixels, diagonal split orientation, seam appearance, collision routes, controller input and frame-rate behaviour.
- Rendered split behaviour and both native-4K Liam films remain pending under the existing visible-capture constraint. No fabricated film, no human approval. Genuine input-driven capture and the required film skills are needed before any review-ready claim. See `FRICTIONAL.md`.

Repository: https://github.com/nikbearbrown/walker-viewport-dynamic-split-screen
