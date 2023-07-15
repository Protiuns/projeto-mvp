extends "res://Scripts/StateMachine/StateMachine.gd"

@onready var animacao = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	EstadoAdicionar("Parado")
	EstadoAdicionar("Perseguindo")
	call_deferred("set_estado" , estados.Parado)


func _EstadoLogica (delta):
	if (estado == estados.Perseguindo) :
		parent.Perseguindo()
	else:
		parent.Parado()
func _EstadoTranzicao(delta):
	if (parent.dir.length() > 100):
		
		return estados.Perseguindo
	else:
		return estados.Parado
func _EstadoEntrar(novoEstado , antigoEstado):
	match novoEstado:
		estados.Perseguindo:
			animacao.play("Andando")
		estados.Parado:
			animacao.play("Parado")
func _EstadoSair(antigoEstado, novoEstado):
	pass
