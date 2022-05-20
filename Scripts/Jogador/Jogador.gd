extends KinematicBody2D
var speed = 200  # speed in pixels/sec
var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("Direita"):
		velocity.x += 1
	if Input.is_action_pressed("Esquerda"):
		velocity.x -= 1
	if Input.is_action_pressed("Baixo"):
		velocity.y += 1
	if Input.is_action_pressed("Cima"):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
