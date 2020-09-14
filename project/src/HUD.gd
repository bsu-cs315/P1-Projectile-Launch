extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_projectiles_remaining(projectiles_left):
	$ProjectilesLeft.text = "Projectiles Remaining: " + str(projectiles_left)
	
func update_score():
	$Score.text = "Score: 10"

func _on_ResetButton_pressed():
	get_tree().reload_current_scene()
