extends Node2D
var t = 0
var health = 5
var initial = true
onready var AttCD = $AttackCD
func start():
	randomize()
	get_node("Position2D").transform.origin.x = 500
	get_node("Position2D").transform.origin.y = 250
	get_node("HP").transform.origin.x = 500
	get_node("HP").transform.origin.y = 250
	pass

func _process(_delta):
	get_node("Enemy").transform=rotacion(get_node("Position2D").transform, get_node("Enemy").transform)
	if AttCD.is_stopped():
		AttCD.start()
	
	get_node("HP/Countdown").text = str(round(AttCD.time_left))
	print(Global.health)
	pass

func rotacion(var a, var b):
	t+=0.005
	b.origin.x=a.origin.x+cos(t)*130
	b.origin.y=a.origin.y+sin(t)*130
	return b


func _on_AttackCD_timeout():
	Global.health -=1
	pass # Replace with function body.
