@icon("../../Icones/category_decorator.svg")
extends ArvoreDeComportamentos

class_name Decorador
# 
func _ready():
	if self.get_child_count() != 1:
		print("ArvoreComportamentos erro: Nó Decorador %s deve ter apenas um nó filho" % self.name)
