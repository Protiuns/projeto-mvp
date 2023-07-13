extends CharacterBody2D

enum Estados {Parado , Perseguindo , Atacando, Machucando , Morrendo}
@export var Estado = Estados.Parado
const velocidade = 75

var indoAtras = false

func _physics_process(delta):
	if indoAtras :
		Perseguindo()

	move_and_slide()
func Perseguindo():
	var dir =  $"../Jogador".position - position
	velocity = dir.normalized() * velocidade
func Parado():
	velocity = Vector2.ZERO
func Machucado():
	pass
func Patrulhando():
	pass
func IrAtras():
	indoAtras = true
