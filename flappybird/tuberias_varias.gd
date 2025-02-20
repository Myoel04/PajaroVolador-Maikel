extends Node2D

var velocity = 300

func _ready() -> void:
	position.x = 190 #posicion con la que se empieza
	position.y = randi_range(120,376)#qeu cambie entre los rangos

func _process(delta: float) -> void:
	position.x -= delta * velocity

func _on_visible_on_screen_exit() -> void:
	queue_free() #para que al salir de la pantalla desaparezca


func _on_tuberia_2abajo_pajaro(body: Node2D) -> void:
	if body is Pajaro:          #cuando choque el pájaro muere
		print("Murió el pájaro")
