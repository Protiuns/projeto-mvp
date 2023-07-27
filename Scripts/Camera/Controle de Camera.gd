extends Node2D

@export var Alvo  = Node2D
@onready var camera = $Camera2D as Camera2D
var posicaoCameraDesejada = Vector2()
var distanciaCameraMax = 16
var vetorDistanciaCamera = Vector2(0 , 20)

func _ready():
	posicaoCameraDesejada = camera.position
	#camera.position = Alvo.position + Alvo.direcao * distanciaCameraCentro
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = Alvo.position
	
	vetorDistanciaCamera = Alvo.direcao * distanciaCameraMax
	vetorDistanciaCamera = Vector2 (int(vetorDistanciaCamera.x) , int(vetorDistanciaCamera.y))
	var tween = create_tween()
	tween.tween_property( camera,"position", vetorDistanciaCamera , 0.5)
	
	
