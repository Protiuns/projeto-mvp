extends CharacterBody2D
class_name ControleMovimentacao

@export var VelocidadeComponente: Velocidade_comp

func _physics_process(delta):
	
	velocity = VelocidadeComponente.velocidade
	if VelocidadeComponente.emMovimento:
		move_and_slide()
