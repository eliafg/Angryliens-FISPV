extends Sprite
#DEFINICION DE VARIABLES
var speed = 0.7
var t = 0
#FUNCION DE INICIO UTILIZADA CADA VEZ QUE SE INSTANCIA UN NUEVO ENEMIGO
func start():
	randomize()
	position.x = 1040.665
	var randy = rand_range(100,550)
	position.y = randy
	print(randy)
	pass

func _ready():
	randomize()

#ESTA FUNCION SE ENCARGA DE MOVER AL ENEMIGO EN LINEA RECTA HACIA LA IZQUIERDA
func _process(delta):
	transform = moveenemy(transform)
	pass

#ESTA FUNCION HACE LOS CALCULOS PARA MOVER AL ENEMIGO
func moveenemy(tr):
	var X = speed
	t+=0.01
	tr.origin.x = tr.origin.x-X
	return tr
	pass
