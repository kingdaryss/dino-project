extends Area2D

var cacto = preload("res://CactoG.tscn")
var pedra = preload("res://PedraG.tscn")
var obstaculos = [cacto, pedra]
var obstaculo = 0

#fisica
export(bool) var IsVivo = true
export(bool) var IsGrounded = false
var trilhaCimaMax = -400
var trilhaBaixoMax = -200
var trilhaAtual = -200
var positionX = 50
var chao = Vector2(positionX, trilhaAtual)
var gravidade = 4000
var velocidade = Vector2()
var velocidade_pulo = -1200
var modificador_gravidade = 2.3

# randomize
var rng = RandomNumberGenerator.new()


# cacto intervalo
var tempo = 0
var intervalo = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	set_position(chao)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rng.randomize()
	var intervalo = rng.randf_range(0.1, 2.0)
	if !(trilhaAtual <= -350):
		set("z_index", 1)
	if !(trilhaAtual <= -290):
		set("z_index", 2)
	if !(trilhaAtual <= -200):
		set("z_index", 3)
	if !(trilhaAtual <= -150):
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
		IsGrounded = true
	else:
		IsGrounded = false

func colidiu(area):
	if IsGrounded == true:
		IsVivo = false
		$"Dino-idle_00000".animation = "idle"
		get_tree().paused = true
		get_parent().get_node("GameOver").show()

func _randomize_obstaculos():
	obstaculo = randi()%3

