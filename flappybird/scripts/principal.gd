extends Node  # Extiende de Node para aprovechar las características básicas de un nodo en Godot.

@export var tuberia_escena: PackedScene  # Permite seleccionar una escena de tubería desde el editor.

# Inicializa el nodo, conecta señales y prepara elementos necesarios al cargarse.
func _ready() -> void:
	#$TimerTuberia.start()  # Comentado para evitar inicio automático del timer.
	Global.connect("on_game_start", start_game)  # Conecta la señal de inicio del juego a la función start_game.
	pass

# Inicia el timer para crear tuberías cuando el juego comienza.
func start_game():
	$TimerTuberia.start()

# Crea tuberías en el juego al activarse el timer.
func crear_tuberia():
	var tuberia = tuberia_escena.instantiate()  # Instancia una nueva tubería.
	add_child(tuberia)  
	# Configura la velocidad inicial de la tubería si el método está disponible.
	if tuberia.has_method("set_initial_velocity"):
		tuberia.set_initial_velocity(Global.tube_velocity)

# Maneja la creación de tuberías cada vez que el timer se activa.
func _on_timer_tuberia_timeout() -> void:
	crear_tuberia()

# Detiene el juego y el timer de tuberías cuando el pájaro colisiona con el suelo.
func _on_suelo_area_body_entered(body: Node2D) -> void:
	if body is Pajaro:
		Global.gameOver()
		$TimerTuberia.stop()
		$AudioGameOver.play()

# Similar al manejo del suelo, detiene el juego si el pájaro colisiona con el área del cielo.
func _on_cielo_area_body_entered(body: Node2D) -> void:
	if body is Pajaro:
		Global.gameOver()
		$TimerTuberia.stop()
		$AudioGameOver.play()
