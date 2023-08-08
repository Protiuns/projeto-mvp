@icon("./ataque.svg")
extends Area2D

class_name Ataque_comp

@export var Dano = 1

var alvosEncontrados = []
var podeAtacar = false

func _process(delta):
	if podeAtacar:
		if area_entered:
			pass

func ComecarAtaque():
	podeAtacar = true
	alvosEncontrados = get_overlapping_areas()
func FinalizarAtaque():
	podeAtacar = false
	CausarDano()
	alvosEncontrados = []
	
func CausarDano():
	pass
