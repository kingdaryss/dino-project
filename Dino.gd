extends Area2D
var trilhaCimaMax = -300
var trilhaBaixoMax = -100
var trilhaAtual = -200
var chao = Vector2(90, trilhaAtual)
var gravidade = 4000
var velocidade = Vector2()
var velocidade_pulo = -1800
var modificador_gravidade = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	set_position(chao)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	velocidade.y += gravidade * delta
	
	if Input.is_action_pressed("pular"):
		velocidade.y += gravidade * delta
	else:
		velocidade.y += gravidade * delta * modificador_gravidade
	
	
	if Input.is_action_just_pressed("pular") and position == chao:
		velocidade.y = velocidade_pulo
	
	if Input.is_action_pressed("cima"):
		if trilhaAtual > trilhaCimaMax:
			trilhaAtual += -10
			chao = Vector2(90, trilhaAtual)
	else:
		if Input.is_action_pressed("baixo"):
			if trilhaAtual < trilhaBaixoMax:
				trilhaAtual += +10
				chao = Vector2(90, trilhaAtual)
	
	position += velocidade * delta
	
	
	if get_position().y > chao.y:
		set_position(chao)
