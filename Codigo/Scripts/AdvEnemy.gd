extends Sprite

#DEFINICION DE VARIABLES
export (float, 1, 1000) var frequency = 2
export (float, 1000) var amplitude = 150
var time = 0

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
	time += delta
	var movement = cos(time*frequency)*amplitude
	position.y -= movement*delta
	position.x -= 0.3
	if position.x <= 15.71:
		Global.health -= 1
		self.queue_free()
	elif Global.health==0:
		self.queue_free()
	pass
