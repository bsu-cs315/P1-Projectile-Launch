extends CanvasLayer


func _on_PlayButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://project/src/Level.tscn")
