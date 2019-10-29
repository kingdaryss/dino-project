extends Area2D

var cacto = preload("res://CactoG.tscn")
var pedra = preload("res://PedraG.tscn")
var obstaculos = [cacto, pedra, cacto]
var obstaculo = 0

var trilhaCimaMax = -425
var trilhaBaixoMax = -200
var trilhaAtual = -200
var positionX = 50
var chao = Vector2(positionX, trilhaAtual)
var gravidade = 4000
var velocidade = Vector2()
var velocidade_pulo = -2000
var modificador_gravidade = 2.3

# cacto intervalo
var tempo = 0
var intervalo = 0
var tempos = [0.3, 0.5, 0.8, 1.0, 1.5, 1.6, 1.7, 1.9]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_position(chao)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var intervalo = rand_range(0, tempos.size())
	if !(trilhaAtual <= -425):
		set("z_index", 1)
	if !(trilhaAtual <= -350):
		set("z_index", 2)
	if !(trilhaAtual <= -290):
		set("z_index", 3)
	if !(trilhaAtual <= -200):
		set("z_index", 4)
	
	tempo+=delta
	if tempo>=intervalo:
		tempo = 0
		_randomize_obstaculos()
		get_parent().add_child(obstaculos[obstaculo].instance())
	
	velocidade.y += gravidade * delta
	
	if Input.is_action_pressed("pular"):
		velocidade.y += gravidade * delta
	else:
		velocidade.y += gravidade * delta * modificador_gravidade
	
	
	if Input.is_action_just_pressed("pular") and position == chao:
		velocidade.y = velocidade_pulo
	
	if Input.is_action_pressed("cima"):
		if trilhaAtual > trilhaCimaMax:
			trilhaAtual += -5
			chao = Vector2(positionX, trilhaAtual)
	else:
		if Input.is_action_pressed("baixo"):
			if trilhaAtual < trilhaBaixoMax:
				trilhaAtual += +5
				chao = Vector2(positionX, trilhaAtual)
	
	position += velocidade * delta
	
	
	if get_position().y > chao.y:
		set_position(chao)

func colidiu(area):
	get_tree().change_scene("res://Menu.tscn")

func _randomize_obstaculos():
	obstaculo = randi()%3
