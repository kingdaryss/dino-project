extends Control

var scena = preload("res://Deserto.tscn")
var center = Vector2(-350, -850)

# INSTANCIANDO NO MEIO DO NODE2D
func _ready():
	set_position(center)
	pass 

# IR PARA MENU PRINCIPAL
func _on_menuprincipal_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass



# DINO T-REX
func _on_btnTrex_pressed():
	mudaCenaNode2D()
	get_node("/root/Node2D/Deserto/Dino").AnimationRunning = "trex-running"
	get_node("/root/Node2D/Deserto/Dino").AnimationDying = "trex-dying"
	self.queue_free()
	pass

# DINO DINO-ESPINHO
func _on_btnSpike_pressed():
	mudaCenaNode2D()
	get_node("/root/Node2D/Deserto/Dino").AnimationRunning = "dinoSpike-running"
	get_node("/root/Node2D/Deserto/Dino").AnimationDying = "dinoSpike-dying"
	self.queue_free()
	pass 


#FUNC PARA MUDAR DE CENA
func mudaCenaNode2D():
	get_node("/root/Node2D").add_child(scena.instance())
	pass


