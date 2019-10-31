extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jogar_novamente_pressed():
	get_tree().change_scene("res://Node2D.tscn")
	get_tree().paused = false
	pass # Replace with function body.


func _on_menu_principal_pressed():
	get_tree().change_scene("res://Menu.tscn")
	get_tree().paused = false
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
