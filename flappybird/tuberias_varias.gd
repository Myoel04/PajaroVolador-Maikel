extends Node2D

var velocity = 200

#EMPEZAR EL JUEGO Y CREAR LAS TUBERIAS EN DICHA POSICION
#Y QUE SE GENERE EL AGUJERO DONDE PASA EN EL RANGO PUESTO
func _ready() -> void:
	position.x = 190 											#posicion con la que se empieza
	position.y = randi_range(120,370)								#qeu cambie entre los rangos

func _process(delta: float) -> void:
	position.x -= delta * velocity

#CUANDO DESAPARECEN LAS TUBERIAS
func _on_visible_on_screen_exit() -> void:
	queue_free() #para que al salir de la pantalla desaparezca

#CUANDO CHOCA EL PAJARO CON LA TUBERIA DE ABAJO
func _on_tuberia_2abajo_pajaro(body: Node2D) -> void:
	if body is Pajaro:  
		Global.gameOver()  # Luego llama a gameOver
		$AudioGameOver.play()

#método para que al pasar una tuberia se sume un punto 
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Pajaro:
		Global.increment_score()
		$AudioPunto.play()
