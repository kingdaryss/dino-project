extends Area2D

onready var dino = get_parent().get_node("Dino")
#-450 a -200
var chao = Vector2(1400,-400)
var velocidade = Vector2(-800,0)
var tempo_vida = 5
var cactos = [-420, -350, -290, -200, -170]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var c = rand_range(0, cactos.size())
	if cactos[c] == -420:
		set("z_index", -1)
	else:
		if cactos[c] == -350:
			set("z_index", 1)
		else:
			if cactos[c] == -290:
				set("z_index", 1)
			else:
				if cactos[c] == -200:
					set("z_index", 2)
				else:
					if cactos[c] == -170:
						set("z_index", 3)
	chao = Vector2(1400, cactos[c])

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
