extends Node2D
#VARIBALES PARA ENEMIGOS Y PROYECTIL
var Bullet = preload("res://Scenes/Bullet.tscn")
var BasicEnemy = preload("res://Scenes/BasicEnemy.tscn")
var AdvEnemy = preload("res://Scenes/AdvEnemy.tscn")
var MiniEnemy = preload("res://Scenes/MiniEnemy.tscn")
var ShieldEnemy = preload("res://Scenes/ShieldEnemy.tscn")
var BossEnemy = preload("res://Scenes/BossEnemy.tscn")
var GreenAlien =preload("res://Scenes/GreenAlien.tscn")

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
var speed=50
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
			$lasershot.play()
			update()

#FUNCION ENCARGADA DE INSTANCIAR UN NUEVO ENEMIGO EN LA PANTALLA
#ESTA SELECCIÓN ES ALEATORIA Y SE DECIDE ENTRE 3 ENEMIGOS
#CUANDO EL CONTADOR LOCAL LLEGUE A 4 O 8, MANDA A INVOCAR UN ALIEN VERDE
#CUANDO EL CONTADOR LOCAL LLEGUE A 10, INVOCA AL JEFE Y REINICIA EL CONTADOR LOCAL
func spawn():
	if localscore < 10:
		localscore += 1
		var enemy = [AdvEnemy,BasicEnemy,MiniEnemy]
		var spawnselection = enemy[randi() % enemy.size()]
		#Enemigo añadido, GreenAlien
		if localscore == 4 or localscore== 8:
			var mobo = GreenAlien.instance()
			mobo.get_node("Enemy").start()
			get_parent().add_child(mobo)
			update()
		else:
			var mob = spawnselection.instance()
			mob.get_node("Enemy").start()
			get_parent().add_child(mob)
			update()
			
	elif localscore ==10:
		localscore = 0
		$soundboss.play()
		var enemy = BossEnemy
		var mob = enemy.instance()
		mob.start()
		get_parent().add_child(mob)
		update()
		
	else: 
		pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$backgroundmusic.play()
	set_process_input(true)
	pass # Replace with function body.

#ESTA FUNCION DIBUJA LA TRAYECTORIA PARABOLICA DE LA BALA
func _draw():
	ballist()
# Called every frame. 'delta' is the elapsed time since the previous frame.

#FUNCION QUE SE  ENCARGA DEL FONDO EN MOVIMIENTO, ASÍ COMO DE LA APARICION DE LOS ENEMIGOS
#LA ACTUALIZACION DEL SCORE Y LAS VIDAS
#TAMBIEN SE ENCARGA DE LLEVAR EL TEMPORIZADOR DE DISPARO
func _process(delta):
	if $Background.position.x<=1000:
		$Background.position.x+=speed*delta
	else:
		$Background.position.x=100
	if Global.score>=10:
		$Background.position.x=-1000
		$level2.position.y=500
		if $level2.position.x<=1000:
			$level2.position.x+=speed*delta
		else:
			$level2.position.x=100
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
