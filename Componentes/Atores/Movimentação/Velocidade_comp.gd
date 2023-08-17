extends Node

class_name Velocidade_comp

@export var DirecaoComponete: Direcao_comp
@export var VelocidadeInicialVetor = Vector2.ZERO
@export var VelocidadeMaxima = 30.00
@export var VelocidadeMinima = 2.00
@export var Aceleracao = 5.00
@export var Desaceleracao = 0.30

var velocidade = Vector2.ZERO

var emMovimento = false

func _ready():
	velocidade = VelocidadeInicialVetor
	
func _physics_process(delta):
	if velocidade.length() != 0.0 :
		emMovimento = true
	else:
		emMovimento = false
