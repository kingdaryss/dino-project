extends Area2D

onready var dino = get_parent().get_node("Dino")
var chao = Vector2(1400,-400)
var velocidade = Vector2(-800,0)
var tempo_vida = 5
var pedras = [-400,-325,-270,-200]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var c = rand_range(0, pedras.size())
	if pedras[c] == -400:
		set("z_index", -1)
	else:
		if pedras[c] == -325:
			set("z_index", 0)
		else:
			if pedras[c] == -270:
				set("z_index", 1)
			else:
				if pedras[c] == -200:
					set("z_index", 2)
	chao = Vector2(1400, pedras[c])
	connect("area_entered", dino, "colidiu")
	connect("area_exited", dino, "colidiu")
	set_position(chao)
	

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(position + get_node("/root/Node2D").velocidade * delta)
	tempo_vida = tempo_vida - delta
	if tempo_vida <= 0:
		queue_free()
	pass
