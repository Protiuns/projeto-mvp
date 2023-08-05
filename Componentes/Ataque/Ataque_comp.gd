@icon("./ataque.svg")
extends Area2D

class_name Ataque_comp

@export var Dano = 1

func Atacar():
	var colisores = get_overlapping_areas()
	
