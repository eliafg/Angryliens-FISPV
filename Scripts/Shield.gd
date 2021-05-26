extends Area2D
var health = 1
func hit():
	if health == 0:
		Global.score+=2
		get_parent().queue_free()
	else:
		health -= 1
	pass

