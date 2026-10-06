extends Sprite2D

const WAND_TEXTURE: Texture2D = preload("res://wand01.png")
const PROJETIL: PackedScene = preload("res://cajado_projetil.tscn")

@export var distancia_cajado: float = 15.0
@export var distancia_spawn_projetil: float = 10.0

func rotacionarSprite() -> void:
	var mouse = get_global_mouse_position()
	var direction = (mouse - get_parent().global_position).normalized()

	position = direction * distancia_cajado
	rotation = direction.angle()

	# Ao mirar para a esquerda, inverte o eixo perpendicular ao cajado.
	# flip_h inverteria também a direção para a qual ele aponta.
	flip_v = direction.x < 0.0


func disparar() -> void:
	var direcao := (get_global_mouse_position() - global_position).normalized()
	if direcao == Vector2.ZERO:
		return

	var projetil := PROJETIL.instantiate() as CajadoProjetil
	projetil.direcao = direcao
	get_tree().current_scene.add_child(projetil)
	projetil.global_position = global_position + direcao * distancia_spawn_projetil

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			disparar()


func _ready() -> void:
	texture = WAND_TEXTURE


func _process(_delta: float) -> void:
	rotacionarSprite()
