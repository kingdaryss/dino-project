extends Node2D

# PRELOADS DAS CENAS
const selectUser = preload("res://SelectUser.tscn")
const desert = preload("res://Deserto.tscn")
const gameOver = preload("res://GameOver.tscn")

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false

# INSTANCIANDO A CENA DA SELEÇÃO DO DINOSSAURO

	self.add_child(selectUser.instance())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
