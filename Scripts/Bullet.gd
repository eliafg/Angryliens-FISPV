extends Sprite

var shoot_angle = 0
var init_velocity = 115
var gravity = 9.80665
var dt = 1
var gun_pos = Vector2(111.589, 572.114)
var angle = 0
var posicion = 0
var t = 0


func start(pos, dir):
	angle = dir
	posicion = pos
	rotation = dir
	position = pos

func _process(delta):
	transform = shoot(angle,posicion,transform)
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func shoot(var shoot_angle,var pos,var tr):
	var Vx = init_velocity*cos(shoot_angle)
	var Vy = init_velocity*sin(shoot_angle)
	var L = pow(init_velocity,2)*sin(2*shoot_angle)/gravity
	var T = 2*init_velocity*sin(shoot_angle)/gravity
	t+=0.006
	var X = Vx * t * dt
	var Y = Vy * t * dt - gravity * pow(t*dt,2) / 2
	tr.origin.x = pos.x+X
	tr.origin.y = pos.y-Y
	return tr
