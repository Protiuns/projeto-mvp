@icon("../../Icones/fail.svg")
extends Decorador_adc

class_name FalhaSempreDecorador_adc

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.Rodar(ator, quadro)
		if resposta == Rodando:
			return Rodando
		return Fracasso
	
