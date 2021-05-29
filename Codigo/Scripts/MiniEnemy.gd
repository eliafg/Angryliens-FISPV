extends Sprite
#DEFINICION DE VARIABLES
var speed = 0.6
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

#ESTA FUNCION SE ENCARGA DE MOVER AL ENEMIGO Y REVISAR SI ESTE LLEGO A SU
#DESTINO, CON EL MOTIVO DE BAJARLE UNA VIDA AL JUGADOR
func _process(delta):
	transform = moveenemy(transform)
	checkhit(transform)
	pass

#FUNCION QUE MUEVE AL ENEMIGO
func moveenemy(tr):
	var X = speed
	tr.origin.x -= X
	return tr
	pass

#FUNCION QUE REVISA SI ESTE ENEMIGO LLEGO AL LADO IZQUIERDO DE LA PANTALLA
func checkhit(tr):
	if tr.origin.x <= 15.71:
		Global.health -= 1
		self.queue_free()
	elif Global.health==0:
		self.queue_free()
	pass

