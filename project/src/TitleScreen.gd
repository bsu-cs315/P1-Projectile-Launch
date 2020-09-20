extends CanvasLayer

var simultameous_scene = preload("res://project/src/Level.tscn").instance()


func _add_a_scene_manually():
	get_tree().get_root().add_child(simultameous_scene)

func _on_PlayButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://project/src/Level.tscn")
