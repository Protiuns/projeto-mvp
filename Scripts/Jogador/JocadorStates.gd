extends "res://Scripts/StateMachine/StateMachine.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	EstadoAdicionar("Parado")
	EstadoAdicionar("Andando")
	EstadoAdicionar("Golpe1")
	EstadoAdicionar("Golpe2")
	EstadoAdicionar("Machucado")
	call_deferred("set_estado" , estados.Parado)

func _EstadoLogica (delta):
	pass
func _EstadoTranzicao(delta):
	pass
func _EstadoEntrar(novoEstado , antigoEstado):
	pass
func _EstadoSair(antigoEstado, novoEstado):
	pass


func _process(delta):
	pass
