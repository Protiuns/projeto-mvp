extends AnimationTree

@onready var jogador = $".."
# Called when the node enters the scene tree for the first time.

func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set("parameters/Parado/blend_position", jogador.direcao)
	set("parameters/Andando/blend_position", jogador.direcao)
	set("parameters/Golpe1/blend_position", jogador.direcao)
	set("parameters/Golpe2/blend_position", jogador.direcao)
	if animation_finished:
		print(animation_started.get_name())
	#set("parameters/Atacando/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	#set("parameters/Movimentando/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	#set("parameters/Andando/blend_position", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	#set("parameters/Parado/blend_position", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	pass
	
