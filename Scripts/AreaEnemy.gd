extends Area2D


func hit():
	Global.score+=1
	get_parent().queue_free()
	pass
