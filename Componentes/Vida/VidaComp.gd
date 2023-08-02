extends Node
class_name Vida_comp

@export var vidaMaxima := 10.0
var vida = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	vida= vidaMaxima


func Dano(danoTomado:float):
	
	vida -= danoTomado
	if (vida <= 0): 
		Morrer()

func  Morrer():
	get_parent().queue_free()
	
