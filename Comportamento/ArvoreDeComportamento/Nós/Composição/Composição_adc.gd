@icon("../../Icones/category_composite.svg")
extends ArvoreDeComportamentos

class_name Composicao_adc


func _ready():
	if self.get_child_count() < 1:
		print("ArvoreComportamentos erro: Nó Composição %s deve ter pelo menos um nó filho" % self.name)
