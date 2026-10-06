extends TileMapLayer

@export var map_size := Vector2i(40, 23)


func _ready() -> void:
	for y in map_size.y:
		for x in map_size.x:
			set_cell(Vector2i(x, y), 0, Vector2i.ZERO)
