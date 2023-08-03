@icon("../../Icones/selector.svg")
extends Composicao_adc

class_name SeletorComposicao_adc

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.tick(ator, quadro)

		if resposta != Fracasso:
			return resposta

	return Fracasso
