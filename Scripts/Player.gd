extends Node2D
#VARIBALES PARA ENEMIGOS Y PROYECTIL
var Bullet = preload("res://Scenes/Bullet.tscn")
var BasicEnemy = preload("res://Scenes/BasicEnemy.tscn")
var AdvEnemy = preload("res://Scenes/AdvEnemy.tscn")
var MiniEnemy = preload("res://Scenes/MiniEnemy.tscn")
var ShieldEnemy = preload("res://Scenes/ShieldEnemy.tscn")
var BossEnemy = preload("res://Scenes/BossEnemy.tscn")


#VARIABLES PARA FÍSICA
var shoot_angle = 0
var init_velocity = 115
var gravity = 9.80665
var dt = 0.1
var gun_pos = Vector2(111.589, 572.114)
var shoots = 0
var timerCD = 0
var initial = true
var timerEnemy = 0
var localscore = 0
#VARIABLES PARA COOLDOWNS
onready var CooldownShootvar = $CooldownShoot
onready var CooldownSpawn = $CooldownEnemy

#FUNCIÓN DEL TRAZADO DE TRAYECTORIA
func ballist():
	if shoots < 3:
		var Vx = init_velocity*cos(shoot_angle)
		var Vy = init_velocity*sin(shoot_angle)
		var L = pow(init_velocity,2)*sin(2*shoot_angle)/gravity
		var T = 2*init_velocity*sin(shoot_angle)/gravity
		for t in range(T/dt+1):
			var X = Vx * t * dt
			var Y = Vy * t * dt - gravity * pow(t*dt,2) / 2
			draw_circle(Vector2(gun_pos.x+X,gun_pos.y-Y),2,Color(0,1,0))

#FUNCIÓN PARA DETECTAR PRESIONADA DE TECLAS
func _input(event):
	if Input.is_key_pressed(KEY_UP) and shoot_angle < 1.50:
		shoot_angle += 0.03
		get_node("Player/Gun").set_rotation(-1*shoot_angle)
		update()
	if Input.is_key_pressed(KEY_DOWN) and shoot_angle > 0:
		shoot_angle -= 0.03
		get_node("Player/Gun").set_rotation(-1*shoot_angle)
		update()
	if Input.is_key_pressed(KEY_SPACE):
		if CooldownShootvar.is_stopped() and !initial:
			CooldownShootvar.start()
			timerCD = 0
			shoots += 1
			var b = Bullet.instance()
			b.get_node("Bullet").start(gun_pos, shoot_angle)
			get_parent().add_child(b)
			update()

func spawn():
	if localscore < 10:
		localscore += 1
		#ShieldEnemy
		var enemy = [BasicEnemy,AdvEnemy,MiniEnemy]
		var spawnselection = enemy[randi() % enemy.size()]
		var mob = spawnselection.instance()
		mob.get_node("Enemy").start()
		get_parent().add_child(mob)
		update()
	else:
		localscore = 0
		var enemy = BossEnemy
		var mob = enemy.instance()
		mob.start()
		get_parent().add_child(mob)
		update()
	


# Called when the node enters the scene tree for the first time.
func _ready():

	set_process_input(true)
	pass # Replace with function body.

func _draw():
	ballist()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timerCD += delta
	timerEnemy += delta
	if timerCD <= 1:
		get_node("Timer").text = str(round(1-timerCD))
	else:
		get_node("Timer").text = "!"
		initial = false
	if CooldownSpawn.is_stopped():
		CooldownSpawn.start()
		spawn()
		pass
	get_node("Score").text = "Puntuación: " + str(Global.score)
	get_node("Lives").text = "Vidas: " + str(Global.health)
	
	if Global.health == 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
#	pass
