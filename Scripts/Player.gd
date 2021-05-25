extends Node2D
var Bullet = preload("res://Scenes/Bullet.tscn")
var shoot_angle = 0
var init_velocity = 115
var gravity = 9.80665
var dt = 0.1
var gun_pos = Vector2(111.589, 572.114)

func ballist():
	var Vx = init_velocity*cos(shoot_angle)
	var Vy = init_velocity*sin(shoot_angle)
	var L = pow(init_velocity,2)*sin(2*shoot_angle)/gravity
	var T = 2*init_velocity*sin(shoot_angle)/gravity
	for t in range(T/dt+1):
		var X = Vx * t * dt
		var Y = Vy * t * dt - gravity * pow(t*dt,2) / 2
		draw_circle(Vector2(gun_pos.x+X,gun_pos.y-Y),2,Color(0,1,0))

func _input(event):
	if Input.is_key_pressed(KEY_UP) and shoot_angle < 1.50:
		shoot_angle += 0.01
		get_node("Player/Gun").set_rotation(-1*shoot_angle)
		update()
	if Input.is_key_pressed(KEY_DOWN) and shoot_angle > 0:
		shoot_angle -= 0.01
		get_node("Player/Gun").set_rotation(-1*shoot_angle)
		update()
	if Input.is_key_pressed(KEY_SPACE):
		var b = Bullet.instance()
		b.get_node("Bullet").start(gun_pos, shoot_angle)
		get_parent().add_child(b)
		update()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	pass # Replace with function body.

func _draw():
	ballist()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
