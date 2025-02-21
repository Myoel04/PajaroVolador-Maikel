extends Node

signal on_increment_score #creo una señal para cuando pase el pajaro entre
#las tuberias

var score := 0
var is_start := false

func start_game():
	is_start = true

func increment_score():
	score += 1
	#on_increment_score.emit()
	emit_signal("on_increment_score")
#y cuando pasa que emita la señal


func increment_nivel():
	print("para incrementar niveles")

func gameOver():
	get_tree().paused = true
