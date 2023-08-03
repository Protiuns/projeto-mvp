@icon("../../Icones/succeed.svg")
extends Decorador

class_name SucessoSempreDecorador

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.tick(ator, quadro)
		if resposta == Rodando:
			return Rodando
		return Sucesso
