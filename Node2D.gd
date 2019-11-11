extends Node2D

# velocidade
var velocidade = Vector2(-500,0)

#animacoes
export var animationRunning = ''
export var animationDying = ''



# placar
export var primeiro = 0
export var primeiroNome = ""
export var segundo = 0
export var segundoNome = ""
export var terceiro = 0
export var terceiroNome = ""

export var scoreFinal = 0


# Called when the node enters the scene tree for the first time.
func _ready():

# INSTANCIANDO A CENA DA SELEÇÃO DO DINOSSAURO
	get_tree().change_scene('res://SelectUser.tscn')
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
