extends ParallaxBackground

var parallax_offset = Vector2()

func _ready():
	pass

func _process(delta):
# VELOCIDADE DO CHÃO AUMENTADA POR DELTAFRAME CONSULTADO NO res://Deserto.gd

	parallax_offset -= pai.velocidade * -delta
	set_scroll_offset(parallax_offset)
	pass
