extends Area2D

onready var dino = get_parent().get_node("Dino")
var chao = Vector2(1400,-400)
var velocidade = Vector2(-800,0)
var tempo_vida = 5
# POSIÇÕES Y QUE ESTE OBSTACULO PODE NASCER
var cactos = [-420, -350, -290, -200]

# Called when the node enters the scene tree for the first time.
func _ready():

# RANDOMIZE DO ARRAY PARA GERAR CACTO EM UMA DAS POSIÇÕES ACIMA DO ARRAY CACTOS

	randomize()
	var c = rand_range(0, cactos.size())
	chao = Vector2(1400, cactos[c])
	set_position(chao)

# SET Z_INDEX DO OBSTACULO DE ACORDO COM SUAS POSIÇÕES DO ARRAY ACIMA, PARA PERSPECTIVA DE PROFUNDIDADE

	if cactos[c] == -420:
		set("z_index", -1)
	else:
		if cactos[c] == -350:
			set("z_index", 0)
		else:
			if cactos[c] == -290:
				set("z_index", 1)
			else:
				if cactos[c] == -200:
					set("z_index", 2)

# FUNÇÕES DE ENTRADA E SAÍDA DA ÁREA2D DO DINOSSAURO PARA CHAMAR A FUNÇÃO "COLIDIU"

	connect("area_entered", dino, "colidiu")
	connect("area_exited", dino, "saiuColidiu")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

# CONSULTA O DESERTO.GD PARA AUMENTAR A VELOCIDADE DO SELF

	set_position(position + get_node("/root/Node2D/Deserto").velocidade * delta)

# MATANDO O OBSTACULO APÓS O TEMPO_VIDA ESGOTAR
	tempo_vida = tempo_vida - delta
	if tempo_vida <= 0:
		queue_free()
	pass
