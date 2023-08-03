@icon("../Icones/blackboard.svg")
extends Node
class_name QadroDeDadosArvore

var quadro = {}

func Definir(chave, valor, quadro_nome = 'padrao'):
	if not quadro.has(quadro_nome):
		quadro[quadro_nome] = {}
	quadro[quadro_nome][chave] = valor

func Obter(chave, valor_padrao = null, quadro_nome = 'padrao'):
	if Contem(chave, quadro_nome):
		return quadro[quadro_nome].get(chave, valor_padrao)
	return valor_padrao

func Contem(chave, quadro_nome = 'padrao'):
	return quadro.has(quadro_nome) and quadro[quadro_nome].has(chave) and quadro[quadro_nome][chave] != null

func Apagar(key, blackboard_name = 'default'):
	if quadro.has(blackboard_name):
		quadro[blackboard_name][key] = null
