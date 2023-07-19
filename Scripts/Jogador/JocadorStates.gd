extends "res://Scripts/StateMachine/StateMachine.gd"


@onready var jogador = $".."
@onready var arvoreAnimacao =$"../AnimationTree"
var acabouAtaque = false
var segundoGolpe = false

func _ready():
	EstadoAdicionar("Parado")
	EstadoAdicionar("Andando")
	EstadoAdicionar("Golpe1")
	EstadoAdicionar("Golpe2")
	EstadoAdicionar("Machucado")
	call_deferred("set_estado" , estados.Parado)

func _EstadoLogica (delta):
	#print(estado)
	#print(acabouAnimacao)
	match estado:
		estados.Parado:
			pass
		estados.Andando:
			pass
		estados.Golpe1:
			if jogador.botaoAtaque:
				segundoGolpe = true
		estados.Golpe2:
			pass
		estados.Machucado:
			pass
func _EstadoTranzicao(delta):
	match estado:
		estados.Parado:
			if jogador.botaoAtaque :
				return estados.Golpe1
			if (jogador.vetorEntrada.length() != 0):
				return estados.Andando
		estados.Andando:
			if jogador.botaoAtaque :
				return estados.Golpe1
			if (jogador.velocity.length() ==0) :
				return estados.Parado
		estados.Golpe1:
			if acabouAtaque:
				if segundoGolpe:
					return estados.Golpe2
				if ((jogador.vetorEntrada.length() == 0) and (jogador.velocity.length() ==0)):
					return estados.Parado
				else:
					return estados.Andando
		estados.Golpe2:
			if acabouAtaque:
				if ((jogador.vetorEntrada.length() == 0) and (jogador.velocity.length() ==0)):
					return estados.Parado
				else:
					return estados.Andando
		estados.Machucado:
			pass
		
func _EstadoEntrar(novoEstado , antigoEstado):
	match novoEstado:
		estados.Parado:
			arvoreAnimacao.set("parameters/Movimentando/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
			
		estados.Andando:
			arvoreAnimacao.set("parameters/Movimentando/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
			
		estados.Golpe1:
			arvoreAnimacao.set("parameters/Atacando/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		estados.Golpe2:
			arvoreAnimacao.set("parameters/AtacandoOutroBraço/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		estados.Machucado:
			pass
func _EstadoSair(antigoEstado, novoEstado):
	match antigoEstado:
		estados.Golpe1 :
			if (novoEstado !=estados.Golpe2) :
				arvoreAnimacao.set("parameters/Atacando/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
			acabouAtaque =false
		estados.Golpe2:
			segundoGolpe = false
			arvoreAnimacao.set("parameters/AtacandoOutroBraço/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
			arvoreAnimacao.set("parameters/Atacando/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)	
		

func FinalizouAtaque():
	acabouAtaque = true


