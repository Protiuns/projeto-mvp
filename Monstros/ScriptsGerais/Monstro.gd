extends CharacterBody2D

enum Estados {Parado , Perseguindo , Atacando, Machucando , Morrendo}
@export var Estado = Estados.Parado
const velocidade = 30
@onready var dir =  $"../Jogador".position - position

var indoAtras = false

func _physics_process(delta):
	dir =  $"../Jogador".position - position

	move_and_slide()
func Perseguindo():
	
	velocity = dir.normalized() * velocidade
func Parado():
	velocity = Vector2.ZERO
func Machucado():
	pass
func Patrulhando():
	pass
func IrAtras():
	indoAtras = true
