@icon("../../Icones/sequencer.svg")
extends Composicao_adc


class_name SequenciadorComposicao_adc

func Rodar(ator , quadro):
	for c in get_children():
		var resposta = c.Rodar(ator, quadro)

		if resposta != Sucesso:
			return resposta

	return Sucesso
