extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var AnimationRunning = ""
var AnimationDying = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_menuprincipal_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass # Replace with function body.


func _on_btnTrex_pressed():
	get_node("/root/Node2D").AnimationRunning = "trex-running"
	get_node("/root/Node2D").AnimationDying = "trex-dying"
	mudaScenaNode2D()
	pass # Replace with function body.


func _on_btnSpike_pressed():
	get_node("/root/Node2D").AnimationRunning = "dinoSpike-running"
	get_node("/root/Node2D").AnimationDying = "dinoSpike-dying"
	mudaScenaNode2D()
	pass # Replace with function body.
	
func mudaScenaNode2D():
	get_tree().change_scene("res://Node2D.tscn")
	pass


