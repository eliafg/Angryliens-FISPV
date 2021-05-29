extends Area2D

#ESTE SCRIPT CONTIENE LA FUNCION hit() LLAMADA POR LA BALA
#CUANDO ESTA ENTRA EN CONTACTO CON UN ENEMIGO
var health = 1
func hit():
	if health == 0:
		Global.score+=1
		get_parent().queue_free()
	else:
		health -= 1
	pass

