extends Area2D
class_name CajadoProjetil

@export var velocidade: float = 300.0
@export var tempo_de_vida: float = 3.0

var direcao: Vector2 = Vector2.ZERO


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _process(delta: float) -> void:
	global_position += direcao * velocidade * delta
	tempo_de_vida -= delta

	if tempo_de_vida <= 0.0:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("receber_dano"):
		body.receber_dano(1)

	queue_free()
