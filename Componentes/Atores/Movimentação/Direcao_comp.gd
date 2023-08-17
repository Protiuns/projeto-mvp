extends Node

class_name Direcao_comp

@export var DirecaoInicial =Vector2.RIGHT
@export var OlhandoDirecaoInicial = Vector2.RIGHT

var direcao = Vector2.ZERO
var olhandoDirecao = Vector2.RIGHT

func _ready():
	
	direcao = DirecaoInicial
	if olhandoDirecao.length() != 0.0:
		olhandoDirecao = OlhandoDirecaoInicial.normalized()
	
	
	
func _process(delta):
	if direcao.length() != 0.0:
		olhandoDirecao = direcao


func DefinirDirecao(vetor:Vector2):
	pass
func OplharParaDirecao(vetor:Vector2):
	if vetor.length() != 0.0:
		olhandoDirecao = vetor.normalized()
