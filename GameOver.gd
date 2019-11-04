extends Control

var center = Vector2(300, -500)
onready var score_label = get_node('HBoxContainer/score_final')

# INSTANCIANDO NO MEIO DO NODE2D
func _ready():
	set_position(center)
	get_tree().paused = true
	pass 


func _on_jogar_novamente_pressed():
	get_tree().change_scene("res://Node2D.tscn")
	pass 


func _on_menu_principal_pressed():
	get_tree().change_scene("res://Menu.tscn")
	get_tree().paused = false
	pass 


func _on_quit_pressed():
	get_tree().quit()
	pass 
