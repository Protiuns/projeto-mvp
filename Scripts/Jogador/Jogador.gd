extends CharacterBody2D

var velocidade = 50
var vetorEntrada = Vector2.ZERO
var botaoAtaque = false
var seMachucou = false
var direcao = Vector2.RIGHT
@onready var maquinaEstados = $JogadorStates as StateMachine

func  _physics_process(delta):
	Entradas()
	match maquinaEstados.estado:
		maquinaEstados.estados.Parado:
			OrientarDirecao()
			PodeMachucar()
		maquinaEstados.estados.Andando:
			AtualizarVelocidade()
			OrientarDirecao()
			move_and_slide()
		maquinaEstados.estados.Golpe1:
			PodeMachucar()
		maquinaEstados.estados.Golpe2:
			PodeMachucar()
		maquinaEstados.estados.Machucado:
			AtualizarVelocidade()
			OrientarDirecao()
			move_and_slide()
	
	
	
	

func Entradas():
	var vertical = int(Input.is_action_pressed("Baixo")) - int(Input.is_action_pressed("Cima"))
	var horizontal = int(Input.is_action_pressed("Direita")) - int(Input.is_action_pressed("Esquerda"))
	vetorEntrada = Vector2(horizontal , vertical).normalized()
	botaoAtaque = Input.is_action_just_pressed("Ataque")
	
func AtualizarVelocidade():
	velocity = vetorEntrada * velocidade
	
func OrientarDirecao():
	if velocity.length()!= 0 :
		direcao = velocity.normalized()
		
func PodeMachucar():
	pass
