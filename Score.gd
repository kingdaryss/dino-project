extends Control
export var selfscore = 0
var increase_by_time = 10
var trocaFase = 300
var faseAtual = 1

# deserto == 1
# floresta == 2

func _ready():
	pass 
func _process(delta):
	selfscore += increase_by_time * delta
	var score_label = get_node('HBoxContainer/lbl_score_value')
	score_label.text = str(int(selfscore))
	if selfscore >= trocaFase:
		if(faseAtual == 1):
			#fase floresta iniciando
			get_node("/root/Deserto/2maps/deserto").visible = false
			get_node("/root/Deserto/2maps/floresta").visible = true
			get_node("/root/Deserto/2maps2/floresta").visible = true
			get_node("/root/Deserto/floresta/florestafrente").visible = true
			
			faseAtual = 2
			
		else:
			#fase deserto iniciando
			get_node("/root/Deserto/2maps/deserto").visible = true
			get_node("/root/Deserto/2maps/floresta").visible = false
			get_node("/root/Deserto/2maps2/floresta").visible = false
			get_node("/root/Deserto/floresta/florestafrente").visible = false
			faseAtual = 1
		trocaFase += 300
	pai.scoreFinal = selfscore
	pass
