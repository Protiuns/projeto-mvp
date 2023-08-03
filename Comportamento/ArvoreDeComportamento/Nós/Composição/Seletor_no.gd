@icon("../../Icones/selector.svg")
extends Composicao

class_name SeletorComposicao

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.tick(ator, quadro)

		if resposta != Fracasso:
			return resposta

	return Fracasso
