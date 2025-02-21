extends Node
@export var tuberia_escena: PackedScene

func _ready() -> void:
	$TimerTuberia.start()

func crear_tuberia():
	var tuberia = tuberia_escena.instantiate()
	add_child(tuberia)


func _on_timer_tuberia_timeout() -> void:
	crear_tuberia()
