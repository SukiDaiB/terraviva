extends CharacterBody2D

@export var max_life : int = 10
@export var speed := 100.0
@onready var sprite: Sprite2D = $Sprite2D

@onready var life_bar : ProgressBar = $lifeBar

var vida : int

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	if direction.x < 0:
			sprite.flip_h = true
	elif direction.x > 0:
		sprite.flip_h = false
 	
