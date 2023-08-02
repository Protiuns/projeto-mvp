extends ArvoreDeComportamentos

class_name ArvoreDeComportamentosRaiz

const QuadroDeDados = preload("./QuadorDeDadosArvore.gd")
@onready var quadro = QadroDeDadosArvore.new()

@export var Ativo: bool = true

func _ready():
	if self.get_child_count() != 1:
		print("Arvore de Comportamentos error: Raiz deve ter apenas um no filho")
		Desativar()
		return

func _process(delta):
	
	if not Ativo :
		return
	
	quadro.Definir("delta" , delta)
	
	self.get_child(0).Rodar(get_parent() , quadro)

func Ativar():
	Ativo = true
func Desativar():
	Ativo = false
