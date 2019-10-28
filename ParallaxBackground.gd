extends ParallaxBackground

var paralax_offset = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	paralax_offset -= delta * 100
	set_scroll_offset(Vector2(paralax_offset, 0))
	pass
