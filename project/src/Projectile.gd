extends RigidBody2D

export var strength : float = 500


func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		var direction = Vector2(1,-1).normalized()
		var velocity = direction * strength
		apply_impulse(Vector2.ZERO, velocity)
