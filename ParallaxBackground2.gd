extends ParallaxBackground

var parallax_offset = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	parallax_offset -= get_node("/root/Node2D").velocidade * -delta
	set_scroll_offset(parallax_offset)
	pass
