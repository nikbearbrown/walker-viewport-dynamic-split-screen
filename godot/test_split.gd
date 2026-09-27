extends SceneTree

var failures := 0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, label: String) -> void:
	print("PASS " if ok else "FAIL ", label)
	if not ok:
		failures += 1
func key(code: Key, pressed: bool) -> void:
	var event := InputEventKey.new()
	event.physical_keycode = code
	event.pressed = pressed
	Input.parse_input_event(event)
func run() -> void:
	root.size = Vector2i(1280, 720)
	var demo: Node = load("res://split_screen.tscn").instantiate()
	root.add_child(demo)
	await process_frame
	var cameras: Node = demo.get_node("Cameras")
	var p1: CharacterBody3D = demo.get_node("Player1")
	var p2: CharacterBody3D = demo.get_node("Player2")
	var start1 := p1.position
	var start2 := p2.position
	key(KEY_D, true)
	key(KEY_L, true)
	for i in 24:
		await physics_frame
	key(KEY_D, false)
	key(KEY_L, false)
	check(p1.position.x > start1.x, "D moves first player")
	check(p2.position.x > start2.x, "L moves second player")
	p1.set_physics_process(false)
	p2.set_physics_process(false)
	# Explicit static boundary fixtures, never footage or input-driven gameplay.
	for distance in [0.0, 10.0, 15.0, 20.0, 5.0]:
		p1.position = Vector3(0, 0.875, 0)
		p2.position = Vector3(distance, 0.875, 0)
		await process_frame
		await process_frame
		check(cameras.view.material.get_shader_parameter("split_active") == (distance > 10), "split threshold fixture " + str(distance))
		var expected := clampf((distance - 10) / 10 * 3, 0, 3)
		check(is_equal_approx(cameras.view.material.get_shader_parameter("split_line_thickness"), expected), "adaptive thickness fixture " + str(distance))
		check(is_equal_approx(cameras.camera1.position.x, minf(distance, 10) / 2) and is_equal_approx(cameras.camera2.position.x, distance - minf(distance, 10) / 2), "camera fixture " + str(distance))
	root.size = Vector2i(900, 600)
	await process_frame
	await process_frame
	check(cameras.viewport1.size == root.size and cameras.viewport2.size == root.size, "both subviewports resize")
	print("HEADLESS STATE ONLY: input movement plus static boundary fixtures; shader pixels/films unverified. failures=", failures)
	demo.queue_free()
	await process_frame
	quit(1 if failures else 0)
