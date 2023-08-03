@icon("../../Icones/fail.svg")
extends Decorador

class_name FalhaSempreDecorador

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.tick(ator, quadro)
		if resposta == Rodando:
			return Rodando
		return Fracasso
