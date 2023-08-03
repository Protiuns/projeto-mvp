@icon("../../Icones/sequencer.svg")
extends Composicao


class_name SequenciadorComposicao

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.tick(ator, quadro)

		if resposta != Sucesso:
			return resposta

	return Sucesso
