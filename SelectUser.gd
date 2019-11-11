extends Control

# INSTANCIANDO NO MEIO DO NODE2D
func _ready():
	pass 

# IR PARA MENU PRINCIPAL
func _on_menuprincipal_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass



# DINO T-REX
func _on_btnTrex_pressed():
	pai.animationRunning = "trex-running"
	pai.animationDying = "trex-dying"
	mudaCenaNode2D()
	pass

# DINO DINO-ESPINHO
func _on_btnSpike_pressed():
	pai.animationRunning = "dinoSpike-running"
	pai.animationDying = "dinoSpike-dying"
	mudaCenaNode2D()
	pass 

func _on_btnRaptor_pressed():
	pai.animationRunning = "raptor-running"
	pai.animationDying = "raptor-dying"
	mudaCenaNode2D()
	pass


#FUNC PARA MUDAR DE CENA
func mudaCenaNode2D():
	get_tree().change_scene('res://Deserto.tscn')
	pass





