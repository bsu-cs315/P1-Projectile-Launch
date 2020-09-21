extends CanvasLayer


func _on_PlayAgain_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://project/src/Level.tscn")


func _on_BackToTitleScreen_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://project/src/TitleScreen.tscn")
