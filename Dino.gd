extends Area2D

# ANIMAÇÕES DO DINOSSAURO RECEBEM DO res://SelectUser.gd

export var AnimationRunning = ""
export var AnimationDying = ""

# ATRIBUTOS DO DINOSSAURO
export var currentLife : int = 3*2
export var hitMy : bool = false
export var isGrounded : bool = false
var trilhaCimaMax = -420
var trilhaBaixoMax = -200
var trilhaAtual = -220
var positionX = -300
var positionXMax = 0
var chao = Vector2(positionX, trilhaAtual)
var gravidade = 4000
var velocidade = Vector2()
var velocidade_pulo = -2200
var modificador_gravidade = 4

# VARIAVEIS DE OBSTACULO
var cacto = preload("res://CactoG.tscn")
var pedra = preload("res://PedraG.tscn")
var obstaculos = [cacto, pedra]
var obstaculo = 0
var tempo = 0
var intervalo = 0

# OUTRAS VARIÁVEIS
# PARA RANDOMIZAR OS INTERVALOS
var rng = RandomNumberGenerator.new()
# PARA DEBUGAR ANIMAÇÃO DO DINOSSAURO
var injeccion = 0

var intervaloVisibilidade = 0
var tempoVisibilidade = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	rng.randomize()
	set_position(chao)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if hitMy == true:
		tempoVisibilidade = tempoVisibilidade + delta
		if tempoVisibilidade <= 2:
			self.visible = true
			intervaloVisibilidade += 1
			if intervaloVisibilidade >= 5:
				self.visible = false
				intervaloVisibilidade = 0
	if tempoVisibilidade >= 2:
		tempoVisibilidade = 0
		hitMy = false
		self.visible = true
# INTRODUÇÃO DO DINOSSAURO

	if get_position().x < positionXMax:
		positionX += 1
		chao = Vector2(positionX, trilhaAtual)

# INJEÇÃO DE ANIMAÇÃO DE CORRIDA DO DINOSSAURO

	if(injeccion <= 3):
		injeccion += delta
	if(injeccion <= 2):
		$"Dino-idle_00000".animation = self.AnimationRunning

# ALTERANDO O Z_INDEX DO DINOSSAURO DE ACORDO PARA A PERSPECTIVA DE PROFUNDIDADE

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

# INTERVALO DE OBSTACULOS E INSERÇÃO DE OBSTACULO

	var intervalo = rng.randf_range(1.0, 2.0)
	tempo+=delta
	if tempo>=intervalo:
		obstaculo = randi()%2
		get_parent().add_child(obstaculos[obstaculo].instance())
		tempo = 0

# MOVIMENTOS DO DINOSSAURO

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
	pass

func colidiu(area):
	if isGrounded == true:
# afins de gambiarra cada coração vale 2 int
		currentLife -= 1
			
		if currentLife == 2*2:
			get_parent().get_node("heart-life6").animation = "Heart-death"
			hitMy = true
			
		if currentLife == 1*2:
			hitMy = true
			get_parent().get_node("heart-life4").animation = "Heart-death"
			
		if currentLife <= 0:
			get_parent().get_node("heart-life2").animation = "Heart-death"
			get_node("/root/Node2D").add_child(get_node("/root/Node2D/").gameOver.instance())
			$"Dino-idle_00000".animation = self.AnimationDying

	pass
	
func saiuColidiu(area):
# afins de gambiarra cada coração vale 2 int
	currentLife -= 1
		
	if currentLife == 2*2:
		get_parent().get_node("heart-life6").animation = "Heart-death"
		hitMy = true
		
	if currentLife == 1*2:
		get_parent().get_node("heart-life4").animation = "Heart-death"
		hitMy = true
		
	if currentLife <= 0:
		get_parent().get_node("heart-life2").animation = "Heart-death"
		get_node("/root/Node2D").add_child(get_node("/root/Node2D/").gameOver.instance())
		$"Dino-idle_00000".animation = self.AnimationDying
	pass

