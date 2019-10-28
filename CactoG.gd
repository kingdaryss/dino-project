extends Area2D

onready var dino = get_parent().get_node("Dino")
#-450 a -200
var chao = Vector2(1400,-400)
var velocidade = Vector2(-500, 0)
var tempo_vida = 5
var cactos = [-450,-325,-200]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var c = rand_range(0, cactos.size())
	if cactos[c] == -450:
		set("z_index", -3)
	else:
		if cactos[c] == -325:
			set("z_index", 2)
		else:
			if cactos[c] == -200:
				set("z_index", 5)
	chao = Vector2(1400, cactos[c])
	
	set_position(chao)
	
	
	connect("area_entered", dino, "colidiu")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	set_position(position + velocidade * delta)
	tempo_vida = tempo_vida - delta
	if tempo_vida <= 0:
		queue_free()
	pass
