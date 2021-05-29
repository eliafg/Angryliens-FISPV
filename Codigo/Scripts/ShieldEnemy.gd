#SCRIPT INUTILIZADO - DESCONTINUADO

extends Node2D
#DEFINICION DE VARIABLES
var r=1
var t = 0
var theta=0
var dtheta=0
#ESTA FUNCION SE ENCARGA DE MOVER EL ESCUDO RESPECTO AL ALIEN ROSA.
func _process(_delta):
	get_node("Enemy/Shield").transform=rotacion(get_node("Enemy").transform, get_node("Enemy/Shield").transform)
	pass

#FUNCION ENCARGADA DE MOVER EL ESCUDO ALREDOR DEL ALIEN ROSA
func rotacion(var a, var b):
	t+=0.02
	b.origin.x=a.origin.x+r*cos(t)*75
	b.origin.y=a.origin.y+r*sin(t)*75
	return b
