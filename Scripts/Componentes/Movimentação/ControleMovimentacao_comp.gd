extends CharacterBody2D
class_name ControleMovimentacao

var entrada = Vector2.ZERO
var movimento_vet = Vector2.ZERO
var twin: Tween

@export var Velocidade = 0.0
@export var TempoAteVeloxidadeMax = 0.0
@export var TempoAteVeloxidadeMin = 0.0
@export var Destino :Node2D


func _physics_process(delta):
	EntenderEntrada()
	velocity = movimento_vet
	move_and_slide()

func EntenderEntrada():
	entrada = (Destino.position - position).normalized()
	movimento_vet = entrada * Velocidade

func Mover(Direcao:Vector2):
	entrada = Direcao.normalized()

func DefinirMovimento(velocidadeMaxima:float, tempoAteVeloxidadeMaxima:float , tempoAteVeloxidadeMinima:float):
	Velocidade =velocidadeMaxima
	TempoAteVeloxidadeMax = tempoAteVeloxidadeMaxima
	TempoAteVeloxidadeMin = tempoAteVeloxidadeMinima
	
