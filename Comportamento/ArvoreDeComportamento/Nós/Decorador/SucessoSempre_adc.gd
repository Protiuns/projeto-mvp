@icon("../../Icones/succeed.svg")
extends Decorador_adc

class_name SucessoSempreDecorador_adc

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.tick(ator, quadro)
		if resposta == Rodando:
			return Rodando
		return Sucesso
