extends CanvasLayer

func set_projectiles_remaining(projectiles_left):
	$ProjectilesLeft.text = "Projectiles Remaining: " + str(projectiles_left)


func update_score():
	$Score.text = "Score: 10"


func _on_ResetButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()


func _on_BackButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://project/src/TitleScreen.tscn")
