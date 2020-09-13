extends RigidBody2D

export var strength := 500.0
export var rotation_speed := 1.0
export var strength_change_rate := 25.0

var _launched := false
var _angle := 0.0

const MIN_STRENGTH := 300.0
const MAX_STRENGTH := 800.0
const MIN_ARROW_LENGTH := 50.0
const MAX_ARROW_LENGTH := 150.0

func _process(delta):
	if _launched:
		return
	if Input.is_action_pressed("rotate_angle_left"):
		_angle -= rotation_speed * delta
	if Input.is_action_pressed("rotate_angle_right"):
		_angle += rotation_speed * delta
	_angle = clamp(_angle, - PI /2, 0)
	update()
	
	if Input.is_action_just_pressed("Launch"):
		var direction = Vector2(1,0).rotated(_angle)
		var velocity = direction * strength
		var player = AudioStreamPlayer.new()
		self.add_child(player)
		player.stream = load("res://project/assets/launch_sound.wav")
		apply_impulse(Vector2.ZERO, velocity)
		player.play()
		_launched = true
		
	
	if Input.is_action_just_pressed("increase_strength"):
		strength += strength_change_rate
	if Input.is_action_just_pressed("decrease_strength"):
		strength -= strength_change_rate
	strength = clamp(strength, MIN_STRENGTH, MAX_STRENGTH)
	
func _draw():
	if not _launched:
		var arrow_length = range_lerp(strength, MIN_STRENGTH, MAX_STRENGTH, MIN_ARROW_LENGTH, MAX_ARROW_LENGTH)
		draw_line(Vector2.ZERO, Vector2(arrow_length, 0).rotated(_angle), Color.aliceblue, 5)
