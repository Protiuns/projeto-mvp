extends AnimationPlayer

class_name AnimaComAtaque_comp

@export var Ataques:Array[Ataque_comp]

func Atacar(Ataque: Ataque_comp):
	if Ataques.has(Ataque):
		Ataque.Atacar()
