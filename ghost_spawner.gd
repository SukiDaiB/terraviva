# spawna fantasmas fora da tela usando como referência a posicao do player

extends Node2D


@export var ghost_scene: PackedScene
@export var ghosts_per_wave := 3
@export var spawn_radius := 300.0 #distancia maior q a metade da tela(resolucao)

# Centro do circuloDeSpawn = player. 
@onready var player = $"../Player"

func _on_timer_timeout(): # se o tempo do timer acabar(5s), inicia onda de ghosts
	print("O Timer zerou! Tentando criar a onda...")
	spawn_wave()

func spawn_wave(): # loop q spawna ghosts ate q se alcance ghosts_per_wave
	for i in range(ghosts_per_wave):
		spawn_ghost()

func spawn_ghost(): # spawna fantasmas dps de ser chamado 
	# instancia um ghost na memoria
	var ghost = ghost_scene.instantiate()
	
	# sorteia um anglo(kka iaia)
	var random_angle = randf() * TAU 
	
	#transforma o angulo em uma direcao apontada pra fora e determina uma posicao multiplicando direction * radius
	var spawn_direction = Vector2.RIGHT.rotated(random_angle) 
	var spawn_position = player.global_position + (spawn_direction * spawn_radius)
	
		# adiciona o fantasma de fato no jogo, permitindo q ele ande ebizoie
	get_parent().add_child(ghost)
	
	# coloca o fantasma na memoria q foi atribuida a ele na posicao sorteada
	ghost.global_position = spawn_position 
	
	print("Fantasma criado em: ", ghost.global_position)
	
