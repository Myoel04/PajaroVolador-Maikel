extends Node
@export var tuberia_escena: PackedScene

func _ready() -> void:
	#$TimerTuberia.start()
	pass
	
#cuando comience el juego al darle a tap 
func start_game():
	$TimerTuberia.start()

func crear_tuberia():
	var tuberia = tuberia_escena.instantiate()
	add_child(tuberia)


func _on_timer_tuberia_timeout() -> void:
	crear_tuberia()

#choca con el suelo y se para el juego 
func _on_suelo_area_body_entered(body: Node2D) -> void:
	if body is Pajaro:
		Global.gameOver()
		$TimerTuberia.stop() #para que no se creen mas tuberias
