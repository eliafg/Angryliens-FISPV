extends Sprite
var speed = 0.7
var t = 0
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

func _ready():
	randomize()


#FUNCION PROCESS, DICTA EL MOVIMIENTO DEL ENEMIGO
func _process(delta):
	transform = moveenemy(transform)
	if position.x <= 15.71:
		Global.health -= 1
		self.queue_free()
	elif Global.health==0:
		self.queue_free()
	pass

#FUNCION QUE SE ENCARGA DE MOVER AL ENEMIGO EN LINEA RECTA HACIA LA IZQUIERDA 
#DE LA PANTALLA
func moveenemy(tr):
	var X = speed
	tr.origin.x = tr.origin.x-X
	return tr
	pass
