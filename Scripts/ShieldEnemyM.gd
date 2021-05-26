extends Sprite
var speed = 0.7
var t = 0
func start():
	randomize()
	position.x = 1040.665
	var randy = rand_range(100,550)
	position.y = randy
	print(randy)
	pass

func _ready():
	randomize()

func _process(delta):
	transform = moveenemy(transform)
	pass

func moveenemy(tr):
	var X = speed
	t+=0.01
	tr.origin.x = tr.origin.x-X
	return tr
	pass
