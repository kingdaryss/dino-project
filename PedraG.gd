extends Area2D

onready var dino = get_parent().get_node("Dino")
var chao = Vector2(1400,-400)
var velocidade = Vector2(-800,0)
var tempo_vida = 5
var pedras = [-400,-325,-270,-200]

func _ready():
	randomize()
	var c = rand_range(0, pedras.size())
	chao = Vector2(1400, pedras[c])
	set_position(chao)

# SETANDO Z_INDEX DO OBSTACULO DE ACORDO COM SEU ARRAY DE POSIÇÕES PARA PERSPECTIVA DE PROFUNDIDADE

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

# FUNÇÕES DO COLLIDER AREA2D PARA CHAMAR A FUNÇÃO COLIDIU DENTRO DO DINO.GD

	connect("area_entered", dino, "colidiu")
	connect("area_exited", dino, "saiuColidiu")
	pass # Replace with function body.

func _process(delta):

# CONSULTA O DESERTO.GD PARA AUMENTAR A VELOCIDADE DO SELF

	set_position(position + get_node("/root/Node2D/Deserto").velocidade * delta)
	tempo_vida = tempo_vida - delta
	if tempo_vida <= 0:
		queue_free()
	pass
