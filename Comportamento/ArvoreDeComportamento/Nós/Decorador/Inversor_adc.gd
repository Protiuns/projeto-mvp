@icon("../../Icones/inverter.svg")
extends Decorador_adc

class_name InversorDecorador_adc


func Rodar(ator, quadro):
	for c in get_children():
		var resposta = c.Rodar(ator, quadro)

		if resposta == Sucesso:
			return Fracasso
		if resposta == Fracasso:
			return Sucesso

		return Rodando
