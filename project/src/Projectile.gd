extends RigidBody2D

export var strength : float = 500
var ready_for_launch : bool = true
var in_the_air : bool = false
var projectile_state : bool = ready_for_launch 
var direction = Vector2(1,-1).normalized()

func _process(delta):
	if projectile_state == ready_for_launch:
		if Input.is_action_just_pressed("RotateAngleLeft"):
			direction = Vector2(0.5,-1)
		if Input.is_action_just_pressed("RotateAngleRight"):
			direction = Vector2(1.5,-1)
		if Input.is_action_just_pressed("Launch"):
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
			projectile_state  = in_the_air
	if Input.is_action_just_pressed("IncreaseStrength"):
		strength += 25
	if Input.is_action_just_pressed("DecreaseStrength"):
		strength -= 25
