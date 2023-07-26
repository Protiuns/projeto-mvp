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
			AtualizarVelocidade()
			OrientarDirecao()
			PodeMachucar()
		maquinaEstados.estados.Andando:
			AtualizarVelocidade()
			OrientarDirecao()
			move_and_slide()
		maquinaEstados.estados.Atacando:
			AtualizarVelocidade()
			
			PodeMachucar()
		maquinaEstados.estados.Machucado:
			AtualizarVelocidade()
			OrientarDirecao()
			move_and_slide()
	
	
	
	

func Entradas():
	var vertical = int(Input.is_action_pressed("Baixo")) - int(Input.is_action_pressed("Cima"))
	var horizontal = int(Input.is_action_pressed("Direita")) - int(Input.is_action_pressed("Esquerda"))
	vetorEntrada = Vector2(horizontal , vertical).normalized()
	botaoAtaque = Input.is_action_pressed("Ataque")
	
func AtualizarVelocidade():
	velocity = Vector2(int(vetorEntrada.x * velocidade),int(vetorEntrada.y * velocidade))
	
func OrientarDirecao():
	if velocity != Vector2.ZERO :
		direcao = velocity.normalized()
	elif vetorEntrada != Vector2.ZERO:
		direcao = vetorEntrada
func PodeMachucar():
	pass
