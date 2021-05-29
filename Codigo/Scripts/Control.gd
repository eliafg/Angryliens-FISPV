extends Control



func _ready():
	$relax.play()
	pass # Replace with function body.

#CAMBIA ESCENA AL JUEGO
func _on_PlayButton_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
#CAMBIA ESCENA A LOS CRÉDITOS
func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")

#CIERRA EL JUEGO
func _on_ExitButton_pressed():
	get_tree().quit()

#CAMBIA ESCENA AL TUTORIAL
func _on_InstructionButton_pressed():
	get_tree().change_scene("res://Scenes/Tutorial.tscn")
	pass # Replace with function body.
