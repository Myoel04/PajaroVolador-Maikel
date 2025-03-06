extends Node

# Eventos
signal on_increment_score
signal on_game_start
signal on_game_over

# Variables
var score := 0
var high_score := 0
var score_file_path := "user://high_score.save"
var is_start := false
var nivel_actual := 1
var tube_velocity := 200.0

# Funciones
func save_high_score():
	var file = FileAccess.open(score_file_path, FileAccess.WRITE)
	if file != null:
		file.store_var(high_score)
		file.close()

func load_high_score():
	if FileAccess.file_exists(score_file_path):
		var file = FileAccess.open(score_file_path, FileAccess.READ)
		if file != null:
			high_score = file.get_var()
			file.close()

func update_high_score(new_score: int):
	if new_score > high_score:
		high_score = new_score
		save_high_score()

func start_game():
	is_start = true
	score = 0
	nivel_actual = 1
	tube_velocity = 200.0
	load_high_score()
	emit_signal("on_game_start")

func increment_score():
	score += 1
	check_level_up()
	emit_signal("on_increment_score")

func check_level_up():
	# Incrementa el nivel y la velocidad basado en la puntuación
	if score == 15 and nivel_actual == 1:
		nivel_actual += 1
		tube_velocity += 100.0  # Incremento de 30 en score 15
		print("Velocidad aumentada a: ", tube_velocity)
	elif score == 40 and nivel_actual == 2:
		nivel_actual += 1
		tube_velocity += 150.0  # Incremento de 20 en score 40
		print("Velocidad aumentada a: ", tube_velocity)
	elif score == 60 and nivel_actual == 3:
		nivel_actual += 1
		tube_velocity += 200.0  # Incremento de 20 en score 40
		print("Velocidad aumentada a: ", tube_velocity)

func gameOver():
	is_start = false
	update_high_score(score)
	get_tree().paused = true
	emit_signal("on_game_over")

# Ya no necesitamos esta función separada, lo manejamos en check_level_up
# func increase_tube_velocity(amount: float) -> void:
# 	tube_velocity += amount
