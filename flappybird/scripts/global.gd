extends Node  # Este script extiende de Node, permitiendo que este objeto se comporte como un nodo en Godot.

# Eventos
signal on_increment_score  # Señal que se emite cuando la puntuación incrementa.
signal on_game_start  # Señal que se emite al iniciar el juego.
signal on_game_over  # Señal que se emite al finalizar el juego.

# Variables
var score := 0  # Puntuación actual del jugador.
var high_score := 0  # Máxima puntuación alcanzada.
var score_file_path := "user://high_score.save"  # Ruta del archivo donde se guarda el high score.
var is_start := false  # Indicador de si el juego ha comenzado.
var nivel_actual := 1  # Nivel actual del juego.
var tube_velocity := 200.0  # Velocidad inicial de las tuberías.

# Funciones
func save_high_score():
	# Guarda el high score en un archivo para persistir entre sesiones de juego.
	var file = FileAccess.open(score_file_path, FileAccess.WRITE)
	if file != null:
		file.store_var(high_score)
		file.close()

func load_high_score():
	# Cargar el high score 
	if FileAccess.file_exists(score_file_path):
		var file = FileAccess.open(score_file_path, FileAccess.READ)
		if file != null:
			high_score = file.get_var()
			file.close()

func update_high_score(new_score: int):
	# actualizar el scroe maximo
	if new_score > high_score:
		high_score = new_score
		save_high_score()

func start_game():
	# Inicia el juego, reseteando variables y cargando el high score anterior.
	is_start = true
	score = 0
	nivel_actual = 1
	tube_velocity = 200.0
	load_high_score()
	emit_signal("on_game_start")

func increment_score():
	# Incrementa la puntuación, verifica aumento de nivel y emite la señal de incremento de score.
	score += 1
	check_level_up()
	emit_signal("on_increment_score")

func check_level_up():
	# Incrementa el nivel del juego basado en la puntuación alcanzada.
	if score == 15 and nivel_actual == 1:
		nivel_actual += 1
	elif score == 30 and nivel_actual == 2:
		nivel_actual += 1

func gameOver():
	# Finaliza el juego, actualiza el high score si es necesario y emite la señal de game over.
	is_start = false
	update_high_score(score)
	get_tree().paused = true
	emit_signal("on_game_over")

func increase_tube_velocity(amount: float) -> void:
	# Incrementa la velocidad de las tuberías de acuerdo al avance del juego o eventos específicos.
	tube_velocity += amount
