@icon("./alvo.svg")
extends Area2D

class_name AlvoDeAcerto_comp

@export var Vida: Vida_comp

func Dano(quantidade):
	Vida.Dano(quantidade)
