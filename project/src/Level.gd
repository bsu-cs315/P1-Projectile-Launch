extends Node2D

var projectiles_remaining

func _ready():
	projectiles_remaining = 2.0
	add_projectile()

func add_projectile():
	var scene = load("res://project/src/Projectile.tscn")
	var projectile = scene.instance()
	projectile.position = Vector2(100,500)
	add_child(projectile)
	projectile.connect("projectile_launched", self, "launched")

func launched():
	if projectiles_remaining > 0:
		add_projectile()
		projectiles_remaining -= 1
		$HUD.set_projectiles_remaining(projectiles_remaining)

func _on_Area2D_body_entered(body):
	if "Target" in body.name:
		$HUD.update_score()
