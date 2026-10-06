extends CharacterBody2D
class_name Ghost

@export var vida_maxima: int = 3
@export var velocidade: float = 40.0
@export var distancia_de_deteccao: float = 120.0

@onready var barra_de_vida: ProgressBar = $BarraDeVida
@onready var sprite: Sprite2D = $Sprite2D

var vida: int
var player: Node2D


func _ready() -> void:
	vida = vida_maxima
	barra_de_vida.max_value = vida_maxima
	barra_de_vida.value = vida
	player = get_tree().get_first_node_in_group("player") as Node2D


func _physics_process(_delta: float) -> void:
	if not is_instance_valid(player):
		velocity = Vector2.ZERO
		return

	var distancia_ate_player := global_position.distance_to(player.global_position)
	if distancia_ate_player > distancia_de_deteccao:
		velocity = Vector2.ZERO
		return

	var direcao := global_position.direction_to(player.global_position)
	velocity = direcao * velocidade
	move_and_slide()

	if direcao.x != 0.0:
		sprite.flip_h = direcao.x < 0.0


func receber_dano(dano: int = 1) -> void:
	vida = maxi(vida - dano, 0)
	barra_de_vida.value = vida

	if vida == 0:
		queue_free()
