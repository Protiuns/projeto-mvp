@icon("./ataque.svg")
extends Area2D

class_name Ataque_comp

@export var Dano = 1.00

var alvosEncontrados = []
var podeAtacar = false



func ComecarAtaque():
	podeAtacar = true
	alvosEncontrados = get_overlapping_areas()
func FinalizarAtaque():
	podeAtacar = false
	CausarDano()
	alvosEncontrados = []
func AtaqueInstantaneo():
	alvosEncontrados = get_overlapping_areas()
	CausarDano()
	alvosEncontrados = []
	
func CausarDano():
	for c in alvosEncontrados:
		if (c is AlvoDeAcerto_comp):
			c.Dano(Dano)
