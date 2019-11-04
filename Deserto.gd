extends Node2D

var velocidade = Vector2(-500,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

# velocidade de tudo que faz uma consulta aqui por deltaframe*5
# exemplos: obstaculos e chão

	velocidade.x -= delta*5
	pass
