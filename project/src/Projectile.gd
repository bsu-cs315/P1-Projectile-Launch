extends RigidBody2D

export var strength : float = 500
var ready_for_launch : bool = true
var in_the_air : bool = false
var projectile_state : bool = ready_for_launch 
var _angle : float = 0

func _process(_delta):
	if projectile_state == ready_for_launch:
		if Input.is_action_just_pressed("RotateAngleLeft"):
			_angle -= PI / 16
		if Input.is_action_just_pressed("RotateAngleRight"):
			_angle += PI / 16
		_angle = clamp(_angle, - PI /2, 0)
		if Input.is_action_just_pressed("Launch"):
			var direction = Vector2(1,0).rotated(_angle)
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
			projectile_state  = in_the_air
			
	update()
	if Input.is_action_just_pressed("IncreaseStrength"):
		strength += 25
	if Input.is_action_just_pressed("DecreaseStrength"):
		strength -= 25
		
func _draw():
	draw_line(Vector2.ZERO, Vector2(80, 0).rotated(_angle), Color.aliceblue, 5)
