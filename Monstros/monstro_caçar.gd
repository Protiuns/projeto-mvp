extends CharacterBody2D

@export var alvo = CharacterBody2D
var direcaoAlvo = Vector2.ZERO
var velocidade = 20

func _physics_process(delta):
	ProcurarAlvo()
	Seguir()
	move_and_slide()

func ProcurarAlvo():
	direcaoAlvo = alvo.position - position
	direcaoAlvo = direcaoAlvo.normalized()
func Seguir():
	velocity = direcaoAlvo * velocidade
