@icon("../../Icones/limiter.svg")
extends Decorador_adc


class_name LimiterDecorator

@onready var chave = 'limitante_%s' % self.get_instance_id()

@export var max_repeticao:int = 0

func Rodar(ator, quadro):
	var repeticao_atual = quadro.Obter(chave)

	if repeticao_atual == null:
		repeticao_atual = 0

	if repeticao_atual <= max_repeticao:
		quadro.set(chave, repeticao_atual + 1)
		return self.get_child(0).Rodar(ator, quadro)
	else:
		return Fracasso
