extends Node

signal on_increment_score #creo una señal para cuando pase el pajaro entre
#las tuberias

var score := 0

func increment_score():
	score += 1
	#on_increment_score.emit()
	emit_signal("on_increment_score")
#y cuando pasa que emita la señal


func gameOver():
	get_tree().paused = true
