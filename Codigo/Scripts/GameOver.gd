extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

#FUNCION QUE SE ENCARGA DE REPRODUCIR EL SONIDO DE GAME OVER, ASÍ COMO REINICIAR
#LA VIDA Y EL SCORE A SUS VALORES ORIGINALES
func _ready():
	$gameover.play()
	Global.health=5
	Global.score=0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#ESTA FUNCION SE ENCARGA DE VOLVER A LA ESCENA DEL JUEGO
func _on_Jugar_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
	pass # Replace with function body.
#ESTA FUNCION SE ENCARGA DE VOLVER A LA ESCENA DEL MENU PRINCIPAL
func _on_Menu_pressed():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.
