extends Sprite

#DEFINICION DE VARIABLES
var shoot_angle = 0
var init_velocity = 115
var gravity = 9.80665
var dt = 1
var gun_pos = Vector2(111.589, 572.114)
var angle = 0
var posicion = 0
var t = 0


#FUNCION DE START
func start(pos, dir):
	angle = dir
	posicion = pos
	rotation = dir
	position = pos

#ESTA FUNCION SE ENCARGA DE LLAMAR A SHOOT, EL CUAL MUEVE LA BALA EN LA
#TRAYECTORIA DE PARABOLA
func _process(delta):
	transform = shoot(angle,posicion,transform)
	pass
#ESTA FUNCION SE ENCARGA DE BORRAR LA BALA CUANDO ESTA DESAPARECE DEL RANGO
#DEFINIDO PARA LA VENTANA DE JUEGO
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

#FUNCION QUE MUEVE LA BALA EN TRAYECTORIA PARABOLICA
func shoot(var shoot_angle,var pos,var tr):
	var Vx = init_velocity*cos(shoot_angle)
	var Vy = init_velocity*sin(shoot_angle)
	var L = pow(init_velocity,2)*sin(2*shoot_angle)/gravity
	var T = 2*init_velocity*sin(shoot_angle)/gravity
	t+=0.03
	var X = Vx * t * dt
	var Y = Vy * t * dt - gravity * pow(t*dt,2) / 2
	tr.origin.x = pos.x+X
	tr.origin.y = pos.y-Y
	return tr

#ESTA FUNCION SE ENCARGA DE LLAMAR LA FUNCION hit(), LA CUAL SE ENCUENTRA
#DENTRO DE LAS AREAS DE TODOS LOS ENEMIGOS
func _on_BulletArea_area_entered(area):
	if area.has_method("hit"):
		area.hit()
		print(area.name)
	queue_free() #or whatever you do to destroy the bullet
	pass # Replace with function body.
