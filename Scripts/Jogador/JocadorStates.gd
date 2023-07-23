extends "res://Scripts/StateMachine/StateMachine.gd"


@onready var jogador = $".."
@onready var arvoreAnimacao =$"../AnimationTree"
var acabouAtaque = false
var segundoGolpe = false

func _ready():
	EstadoAdicionar("Parado")
	EstadoAdicionar("Andando")
	EstadoAdicionar("Atacando")
	EstadoAdicionar("Machucado")
	call_deferred("set_estado" , estados.Parado)
	
func _EstadoLogica (delta):
	
	#print(acabouAnimacao)
	match estado:
		estados.Parado:
			pass
		estados.Andando:
			pass
		estados.Atacando:
			if acabouAtaque:
				arvoreAnimacao.set("parameters/Atacando/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
				if segundoGolpe:
					segundoGolpe = false
					arvoreAnimacao.set("parameters/AtacandoOutroBraço/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
					
				else :
					segundoGolpe = true
					arvoreAnimacao.set("parameters/AtacandoOutroBraço/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

		estados.Machucado:
			pass
func _EstadoTranzicao(delta):
	match estado:
		estados.Parado:
			if jogador.botaoAtaque :
				return estados.Atacando
			elif (jogador.velocity.length() != 0):
				return estados.Andando
		estados.Andando:
			if jogador.botaoAtaque :
				return estados.Atacando
			elif (jogador.velocity.length() ==0) :
				return estados.Parado
		estados.Atacando:
			if acabouAtaque:
				if !jogador.botaoAtaque:
					if ( jogador.velocity.length() ==0):
						return estados.Parado
					else:
						return estados.Andando
						
		estados.Machucado:
			pass
		
func _EstadoEntrar(novoEstado , antigoEstado):
	print(novoEstado)
	match novoEstado:
		estados.Parado:
			arvoreAnimacao.set("parameters/Movimentando/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
			
		estados.Andando:
			arvoreAnimacao.set("parameters/Movimentando/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		
		estados.Atacando:
			arvoreAnimacao.set("parameters/Atacando/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	
		estados.Machucado:
			pass

func _EstadoSair(antigoEstado, novoEstado):
	match antigoEstado:
		estados.Atacando:
			arvoreAnimacao.set("parameters/AtacandoOutroBraço/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
			arvoreAnimacao.set("parameters/Atacando/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)	
			segundoGolpe = false
			acabouAtaque = false

func _LogicaDepoisTransicoes (delta):
	acabouAtaque = false
		

func FinalizouAtaque():
	acabouAtaque = true


