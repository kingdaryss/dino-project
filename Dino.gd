extends Area2D

var cacto = preload("res://CactoG.tscn")
var pedra = preload("res://PedraG.tscn")
var obstaculos = [cacto, pedra]
var obstaculo = 0

#fisica
export(bool) var isVivo = true
export(bool) var isGrounded = false
var trilhaCimaMax = -420
var trilhaBaixoMax = -200
var trilhaAtual = -220
var positionX = 50
var chao = Vector2(positionX, trilhaAtual)
var gravidade = 4000
var velocidade = Vector2()
var velocidade_pulo = -2200
var modificador_gravidade = 4

# randomize
var rng = RandomNumberGenerator.new()


# cacto intervalo
var tempo = 0
var intervalo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$"Dino-idle_00000".animation = get_node("/root/Node2D").AnimationRunning
	randomize()
	rng.randomize()
	set_position(chao)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var intervalo = rng.randf_range(1.0, 2.0)
	if !(trilhaAtual <= -370):
		set("z_index", 0)
	if !(trilhaAtual <= -350):
		set("z_index", 1)
	if !(trilhaAtual <= -300):
		set("z_index", 2)
	if !(trilhaAtual <= -220):
		set("z_index", 3)
	if !(trilhaAtual <= -170):
		set("z_index", 4)
	
	tempo+=delta
	if tempo>=intervalo:
		obstaculo = randi()%2
		get_parent().add_child(obstaculos[obstaculo].instance())
		tempo = 0
	
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
	if get_position().y == chao.y:
		isGrounded = true
	else:
		isGrounded = false

func colidiu(area):
	if isGrounded == true:
		isVivo = false
		$"Dino-idle_00000".animation = get_node("/root/Node2D").AnimationDying
		get_tree().paused = true
		get_parent().get_node("GameOver").show()

func _randomize_obstaculos():
	obstaculo = randi()%3

