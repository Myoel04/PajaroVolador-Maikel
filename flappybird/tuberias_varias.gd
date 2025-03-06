extends Node2D

# Ya no necesitamos estas variables relacionadas con el tiempo
# var speed_increase = 60.0
# var time_to_increase = 1.8
# var elapsed_time = 0.0

# Configura la velocidad inicial de las tuberías
func set_initial_velocity(initial_velocity: float) -> void:
	Global.tube_velocity = initial_velocity

# Inicializa la posición de la tubería y establece una velocidad mínima
func _ready() -> void:
	position.x = 320
	position.y = randi_range(170, 280)  
	if Global.tube_velocity < 200.0:  
		Global.tube_velocity = 200.0

# Actualiza la posición usando la velocidad actual
func _process(delta: float) -> void:
	if Global.is_start:
		# Solo mueve la tubería con la velocidad actual
		position.x -= delta * Global.tube_velocity

# Libera la tubería cuando no es visible
func _on_visible_on_screen_exit() -> void:
	queue_free()

# Finaliza el juego si el pájaro colisiona
func _on_tuberia_2abajo_pajaro(body: Node2D) -> void:
	if body is Pajaro:
		Global.gameOver()
		$AudioGameOver.play()

# Aumenta la puntuación cuando el pájaro pasa
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Pajaro:
		Global.increment_score()
		$AudioPunto.play()
