extends "res://Scripts/StateMachine/StateMachine.gd"

@onready var animacao = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	EstadoAdicionar("Parado")
	EstadoAdicionar("Perseguindo")
	EstadoAdicionar("Atacando")
	call_deferred("set_estado" , estados.Parado)


func _EstadoLogica (delta):
	if (estado == estados.Perseguindo) :
		parent.Perseguindo()
	else:
		parent.Parado()
func _EstadoTranzicao(delta):
	var distanciaAlvo = parent.dir.length()
	if (distanciaAlvo < 50):
		return estados.Atacando
	elif(distanciaAlvo < 280):
		return estados.Perseguindo
	else:
		return estados.Parado
func _EstadoEntrar(novoEstado , antigoEstado):
	match novoEstado:
		estados.Atacando:
			animacao.play("Atacando")
		estados.Perseguindo:
			animacao.play("Andando")
		estados.Parado:
			animacao.play("Parado")
func _EstadoSair(antigoEstado, novoEstado):
	pass
