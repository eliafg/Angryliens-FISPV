extends Sprite
var speed = 0.6
var t = 0
func start():
	randomize()
	position.x = 1040.665
	var randy = rand_range(100,450)
	position.y = randy
	print(randy)
	pass

func _ready():
	randomize()

func _process(delta):
	transform = moveenemy(transform)
	checkhit(transform)
	pass

func moveenemy(tr):
	var X = speed
	tr.origin.x -= X
	return tr
	pass

func checkhit(tr):
	if tr.origin.x <= 15.71:
		Global.health -= 1
		self.queue_free()
	pass

