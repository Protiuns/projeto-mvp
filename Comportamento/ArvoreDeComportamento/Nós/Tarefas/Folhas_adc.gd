@icon("../../Icones/action.svg")
extends ArvoreDeComportamentos

class_name Folha_adc


func _ready():
	if self.get_child_count() != 0:
		print("ArvoreComportamentos erro: Nó folha %s nao deve ter filhos" % self.name)

