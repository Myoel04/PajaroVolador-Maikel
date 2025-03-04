extends Node2D  # Extiende de Node2D, proporcionando funcionalidades específicas para nodos en un espacio 2D.

var speed_increase = 15.0  # Define cuánto incrementar la velocidad de las tuberías cada intervalo.
var time_to_increase = 2  # Intervalo de tiempo en segundos para el aumento de velocidad.
var elapsed_time = 0.0  # Acumulador de tiempo para controlar los incrementos de velocidad.

# Configura la velocidad inicial de las tuberías; implementación depende de uso externo.
func set_initial_velocity(initial_velocity: float) -> void:
	pass

# Inicializa la posición de la tubería y establece una velocidad mínima al cargar.
func _ready() -> void:
	position.x = 190
	position.y = randi_range(150, 300)  # Posición vertical aleatoria para cada tubería.
	if Global.tube_velocity < 200.0:  # Asegura que la velocidad no sea menor de un mínimo.
		Global.tube_velocity = 200.0

# Actualiza la posición de las tuberías y maneja el incremento de velocidad basado en el tiempo.
func _process(delta: float) -> void:
	elapsed_time += delta
	if elapsed_time >= time_to_increase and Global.is_start:
		Global.increase_tube_velocity(speed_increase)  # Aumenta la velocidad de las tuberías.
		elapsed_time = 0.0
		print("Velocidad actual de las tuberías: ", Global.tube_velocity)
	position.x -= delta * Global.tube_velocity  # Mueve la tubería hacia la izquierda.

# Libera la tubería de la memoria cuando esta ya no es visible en pantalla.
func _on_visible_on_screen_exit() -> void:
	queue_free()

# Finaliza el juego si el pájaro colisiona con la tubería.
func _on_tuberia_2abajo_pajaro(body: Node2D) -> void:
	if body is Pajaro:
		Global.gameOver()
		$AudioGameOver.play()

# Aumenta la puntuación y reproduce un sonido cuando el pájaro pasa por entre las tuberías.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Pajaro:
		Global.increment_score()
		$AudioPunto.play()
