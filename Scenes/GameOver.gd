extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$gameover.play()
	Global.health=5
	Global.score=0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Jugar_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	pass # Replace with function body.

func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.
