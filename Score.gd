extends Control
var score = 0
var increase_by_time = 10;

func _ready():
	pass 
func _process(delta):
	score += increase_by_time * delta
	var score_label = get_node('HBoxContainer/lbl_score_value')
	score_label.text = str(int(score))
	if score >= 100:
		get_tree().paused = true
		
	pass
