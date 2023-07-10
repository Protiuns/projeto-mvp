extends CharacterBody2D

var velocidade = 150

func  _physics_process(delta):
	# entradas
	var vertical = int(Input.is_action_pressed("Baixo")) - int(Input.is_action_pressed("Cima"))
	var horizontal = int(Input.is_action_pressed("Direita")) - int(Input.is_action_pressed("Esquerda"))
	
	# movimento
	velocity = Vector2(horizontal , vertical).normalized() * velocidade
	move_and_slide()

