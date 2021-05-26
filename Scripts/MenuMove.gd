extends Node2D

var gravedad=300
var velocidad=0.5

func _ready():
	pass # Replace with function body.

func _process(delta):
	$flying1.position.y += velocidad
	$flying2.position.y +=velocidad
	if $flying1.position.y >=50:
		velocidad=-0.5
	elif $flying1.position.y <=-150:
		velocidad=0.5
		pass
