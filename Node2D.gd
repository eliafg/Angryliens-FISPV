extends Node

var ball=preload("res://pelota.tscn")

func song():
	$disparo.play()
	pass

func _input(event):
	if event.is_action_pressed("disparar"):
		$disparo.play()
		var new_ball = ball.instance()
		new_ball.global_position = $PosBala.global_position
		add_child(new_ball)
