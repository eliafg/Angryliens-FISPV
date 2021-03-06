extends Area2D

#DEFINICION DE VARIABLES
var greenhp = preload("res://Resources/Enemies/FullHP.png")
var yellowhp = preload("res://Resources/Enemies/HalfHP.png")
var redhp = preload("res://Resources/Enemies/NearDeath.png")
var health = 2

#FUNCION DE IMPACTO, SU COMPORTAMIENTO ES EQUIVALENTE AL DE UN SWITCH CASE
func hit():
	match health:
		0:
			Global.score+=3
			get_parent().get_parent().queue_free()
		1:
			get_parent().get_parent().get_node("HP").set_texture(redhp)
			health -= 1
		2:
			get_parent().get_parent().get_node("HP").set_texture(yellowhp)
			health -= 1
	pass
