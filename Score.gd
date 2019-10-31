extends Control
var score = 0
var increase_by_time = 10;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score += increase_by_time * delta
	var score_label = get_node('lbl_score_value')
	score_label.text = str(int(score))
	pass
