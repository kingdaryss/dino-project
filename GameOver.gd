extends Control

onready var seuScore = get_node('ParallaxBackground/VBoxContainer/score_final')
onready var nome = get_node('ParallaxBackground/VBoxContainer/seuNome')

onready var primeiroLugar = get_node('ParallaxBackground/placar/primeiroLugar/pontuacao1')
onready var primeiroNome = get_node('ParallaxBackground/placar/primeiroLugar/nome1')

onready var segundoLugar = get_node('ParallaxBackground/placar/segundoLugar/pontuacao2')
onready var segundoNome = get_node('ParallaxBackground/placar/segundoLugar/nome2')

onready var terceiroLugar = get_node('ParallaxBackground/placar/terceiroLugar/pontuacao3')
onready var terceiroNome = get_node('ParallaxBackground/placar/terceiroLugar/nome3')
onready var scoreFloat = pai.scoreFinal

# INSTANCIANDO NO MEIO DO NODE2D
func _ready():
	primeiroLugar.text = str(int(pai.primeiro))
	primeiroNome.text = pai.primeiroNome
	segundoLugar.text = str(int(pai.segundo))
	segundoNome.text = pai.segundoNome
	terceiroLugar.text = str(int(pai.terceiro))
	terceiroNome.text = pai.terceiroNome
	seuScore.text = str(int(scoreFloat))
	pass 

func _on_jogar_novamente_pressed():
	if scoreFloat > pai.primeiro:
		pai.terceiro = pai.segundo
		pai.terceiroNome = pai.segundoNome
		pai.segundo = pai.primeiro
		pai.segundoNome = pai.primeiroNome
		pai.primeiro = scoreFloat
		pai.primeiroNome = nome.text
	elif scoreFloat > pai.segundo:
		pai.terceiro = pai.segundo
		pai.terceiroNome = pai.segundoNome
		pai.segundo = scoreFloat
		pai.segundoNome = nome.text
	elif scoreFloat > pai.terceiro:
		pai.terceiro = scoreFloat
		pai.terceiroNome = nome.text
	get_tree().change_scene("res://Node2D.tscn")
	pass 


func _on_menu_principal_pressed():
	get_tree().change_scene("res://Menu.tscn")
	pass 


func _on_quit_pressed():
	get_tree().quit()
	pass 


func _on_seuNome_text_changed():
	if nome.get_text().length() >  5:
		nome.readonly = true
	pass # Replace with function body.

func _input(event):
	if Input.is_action_just_pressed('apagar'):
		nome.readonly = false
		
	if Input.is_action_just_pressed('enter'):
		_on_jogar_novamente_pressed()
	pass
