extends Node2D

var velocidade = Vector2(-500,0)
var AnimationRunning = ""
var AnimationDying = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocidade.x -= delta*5
	pass
