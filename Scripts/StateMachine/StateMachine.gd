extends Node
class_name StateMachine

var estado  = null : set = set_estado
var estadoAntigo = null
var estados = {}

@onready var parent = get_parent()

func _physics_process(delta):
	if estado != null:
		_EstadoLogica(estado)
		var transicao = _EstadoTranzicao(delta)
		if (transicao != null):
			set_estado(transicao)
			

func _EstadoLogica (delta):
	pass
func _EstadoTranzicao(delta):
	pass
func _EstadoEntrar(novoEstado , antigoEstado):
	pass
func _EstadoSair(antigoEstado, novoEstado):
	pass

func set_estado(novoEstado):
	estadoAntigo = estado
	estado = novoEstado
	if estadoAntigo != null:
		_EstadoSair(estadoAntigo , novoEstado)
	if novoEstado != null :
		_EstadoEntrar(novoEstado , estadoAntigo)

func EstadoAdicionar(NomeEstado):
	estados[NomeEstado] = estados.size()
	
