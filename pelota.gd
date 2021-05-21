extends KinematicBody2D

var velocidad=Vector2.ZERO

func _process(delta):
	if Input.is_action_pressed("más"):
		velocidad.x=0.3
		velocidad.y=0.001+velocidad.y
		var movimiento= move_and_collide(velocidad)
	elif Input.is_action_pressed("menos"):
		velocidad.x=0.5
		velocidad.y=0.001+velocidad.y
		var movimiento= move_and_collide(velocidad)
	elif Input.is_action_pressed("izquierda"):
		velocidad.x=0.7
		velocidad.y=0.001+velocidad.y
		var movimiento= move_and_collide(velocidad)
	elif Input.is_action_pressed("derecha"):
		velocidad.x=1
		velocidad.y=0.001+velocidad.y
		var movimiento= move_and_collide(velocidad)
	elif Input.is_action_pressed("cero"):
		velocidad.x=1.1
		velocidad.y=0.001+velocidad.y
		var movimiento= move_and_collide(velocidad)
	elif Input.is_action_pressed("uno"):
		velocidad.x=1.3
		velocidad.y=0.001+velocidad.y
		var movimiento= move_and_collide(velocidad)
	elif Input.is_action_pressed("dos"):
		velocidad.x=1.5
		velocidad.y=0.001+velocidad.y
		var movimiento= move_and_collide(velocidad)
	
	

	
