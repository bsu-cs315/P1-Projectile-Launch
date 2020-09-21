extends RigidBody2D

signal projectile_launched

const MIN_STRENGTH := 300.0
const MAX_STRENGTH := 800.0
const MIN_ARROW_LENGTH := 50.0
const MAX_ARROW_LENGTH := 150.0

export var strength := 500.0
export var rotation_speed := 1.0
export var strength_change_rate := 25.0

var _in_the_air := false
var _angle := 0.0


func _process(delta):
	if _in_the_air:
		return
	check_for_adjusted_angle(delta)
	check_for_adjusted_strength()
	check_for_launch()


func check_for_adjusted_angle(delta):
	if Input.is_action_pressed("rotate_angle_left"):
		_angle -= rotation_speed * delta
	if Input.is_action_pressed("rotate_angle_right"):
		_angle += rotation_speed * delta
	_angle = clamp(_angle, - PI /2, 0)
	update()


func check_for_adjusted_strength():
	if Input.is_action_just_pressed("increase_strength"):
		strength += strength_change_rate
	if Input.is_action_just_pressed("decrease_strength"):
		strength -= strength_change_rate
	strength = clamp(strength, MIN_STRENGTH, MAX_STRENGTH)


func check_for_launch():
	var all_projectiles_asleep := true
	var projectiles = get_tree().get_nodes_in_group("projectiles")
	for node in projectiles:
		var projectile = node as RigidBody2D
		if !projectile.sleeping:
			all_projectiles_asleep = false
	if all_projectiles_asleep and Input.is_action_just_pressed("Launch"):
		launch()


func launch():
	var direction = Vector2(1,0).rotated(_angle)
	var velocity = direction * strength
	apply_impulse(Vector2.ZERO, velocity)
	add_sound_effect()
	emit_signal("projectile_launched")
	_in_the_air = true


func add_sound_effect():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://project/assets/launch_sound.wav")
	player.play()	


func _draw():
	if not _in_the_air:
		var arrow_length = range_lerp(strength, MIN_STRENGTH, MAX_STRENGTH, MIN_ARROW_LENGTH, MAX_ARROW_LENGTH)
		draw_line(Vector2.ZERO, Vector2(arrow_length, 0).rotated(_angle), Color.aliceblue, 5)
