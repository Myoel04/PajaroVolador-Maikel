extends Node

signal on_increment_score #creo una señal para cuando pase el pajaro entre
#las tuberias
signal on_game_start
signal on_game_over
var score := 0
var is_start := false

#EMPEZAR EL JUEGO
func start_game():
	is_start = true
	score = 0
	emit_signal("on_increment_score")
	emit_signal("on_game_start") #emitir señal de que empezo el juego

#SUMAR MPUNTOS
func increment_score():
	score += 1
	#on_increment_score.emit()
	emit_signal("on_increment_score")
#y cuando pasa que emita la señal

#INCREMENTAR NIVEL
func increment_nivel():
	print("para incrementar niveles")

#FINALIZAR JUEGO
func gameOver():
	is_start = false
	get_tree().paused = true
	emit_signal("on_game_over") #emitir la señal del game over
