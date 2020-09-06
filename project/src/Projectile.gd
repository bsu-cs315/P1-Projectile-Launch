extends RigidBody2D

export var strength : float = 500
var ready_for_launch : bool = true
var in_the_air : bool = false
var projectile_state : bool = ready_for_launch 

func _process(delta):
	if projectile_state == ready_for_launch:
		if Input.is_action_just_pressed("LaunchUp"):
			var direction = Vector2(0,-1).normalized()
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
			projectile_state  = in_the_air
		if Input.is_action_just_pressed("LaunchRight"):
			var direction = Vector2(1,0).normalized()
			var velocity = direction * strength
			projectile_state  = in_the_air
			apply_impulse(Vector2.ZERO, velocity)
		if Input.is_action_just_pressed("LaunchUpRight"):
			var direction = Vector2(1,-1).normalized()
			var velocity = direction * strength
			apply_impulse(Vector2.ZERO, velocity)
			projectile_state  = in_the_air
	if Input.is_action_just_pressed("IncreaseStrength"):
		strength += 25
		print(strength)
	if Input.is_action_just_pressed("DecreaseStrength"):
		strength -= 25
		print(strength)
