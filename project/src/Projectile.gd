extends RigidBody2D

export var strength : float = 500
export var rotation_speed : float = 1

var _launched := false
var _angle : float = 0

func _process(delta):
	if _launched:
		return
	if Input.is_action_pressed("RotateAngleLeft"):
		_angle -= rotation_speed * delta
	if Input.is_action_pressed("RotateAngleRight"):
		_angle += rotation_speed * delta
	_angle = clamp(_angle, - PI /2, 0)
	if Input.is_action_pressed("Launch"):
		var direction = Vector2(1,0).rotated(_angle)
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO, velocity)
		_launched = true
	update()
	if Input.is_action_just_pressed("IncreaseStrength"):
		strength += 25
	if Input.is_action_just_pressed("DecreaseStrength"):
		strength -= 25
		
func _draw():
	if not _launched:
		draw_line(Vector2.ZERO, Vector2(80, 0).rotated(_angle), Color.aliceblue, 5)
