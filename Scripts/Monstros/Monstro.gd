extends CharacterBody2D


const velocidade = 75

func _physics_process(delta):
	

	move_and_slide()
func Perseguindo():
	var dir =  $"../Jogador".position - position
	velocity = dir.normalized() * velocidade
func Parado():
	velocity = Vector2.ZERO
func Machucado():
	pass
func Patrulhando():
	pass
