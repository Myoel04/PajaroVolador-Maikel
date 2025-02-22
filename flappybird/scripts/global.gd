extends Node

signal on_increment_score #creo una señal para cuando pase el pajaro entre
#las tuberias
signal on_game_start

var score := 0
var is_start := false

func start_game():
	is_start = true
	score = 0
	emit_signal("on_increment_score")
	emit_signal("on_game_start") #emitir señal de que empezo el juego

func increment_score():
	score += 1
	#on_increment_score.emit()
	emit_signal("on_increment_score")
#y cuando pasa que emita la señal


func increment_nivel():
	print("para incrementar niveles")

func gameOver():
	get_tree().paused = true
