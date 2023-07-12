extends CharacterBody2D


const velocidade = 75

func _physics_process(delta):
	var dir =  $"../Jogador".position - position
	velocity = dir.normalized() * velocidade

	move_and_slide()
