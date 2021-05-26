extends Node2D

var r=1
var t = 0
var theta=0
var dtheta=0
func _process(_delta):
	get_node("Enemy/Shield").transform=rotacion(get_node("Enemy").transform, get_node("Enemy/Shield").transform)
	pass

func rotacion(var a, var b):
	t+=0.02
	b.origin.x=a.origin.x+r*cos(t)*75
	b.origin.y=a.origin.y+r*sin(t)*75
	return b
