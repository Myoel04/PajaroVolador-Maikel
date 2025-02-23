extends Node2D

var velocity = 200


func _ready() -> void:
	position.x = 190 #posicion con la que se empieza
	position.y = randi_range(120,376)#qeu cambie entre los rangos


func _process(delta: float) -> void:
	position.x -= delta * velocity

func _on_visible_on_screen_exit() -> void:
	queue_free() #para que al salir de la pantalla desaparezca


func _on_tuberia_2abajo_pajaro(body: Node2D) -> void:
	if body is Pajaro:
		$AudioMuerte.play()  # Reproduce el sonido primero
		Global.gameOver()  # Luego llama a gameOver




#método para que al pasar una tuberia se sume un punto 
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Pajaro:
		Global.increment_score()
		$AudioPunto.play()
