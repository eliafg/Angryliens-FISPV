extends Sprite

#FUNCION START, SE MANDA A LLAMAR POR ENCIMA DE _ready()
#ESTO ES DEBIDO A QUE EL SCRIPT ASOCIADO A ESTA ESCENA NECESITA RECIBIR
#VALORES AL MOMENTO DE INICIALIZARSE
func start():
	randomize()
	position.x = 1040.665
	var randy = rand_range(100,450)
	position.y = randy
	print(randy)
	pass


#FUNCION PROCESS, DICTA EL MOVIMIENTO DEL ENEMIGO
func _process(delta):
	position.y -= delta*200
	position.x -= 0.3
	if position.y <=100:
		position.y=500
	if position.x <= 15.71:
		Global.health -= 1
		self.queue_free()
	elif Global.health==0:
		self.queue_free()
	pass

