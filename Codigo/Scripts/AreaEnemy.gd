extends Area2D

#FUNCION QUE COMPARTEN LOS ENEMIGOS, ESTE SCRIPT VA DENTRO DE LOS SPRITES
#CORRESPONDE A LAS AREAS2D DE LOS ENEMIGOS Y ES MANDADA A LLAMAR POR LA BALA
#CUANDO ESTA ENTRA EN UNA ÁREA
func hit():
	Global.score+=1
	get_parent().queue_free()
	pass