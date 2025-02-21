extends CanvasLayer

func _ready() -> void:
	Global.connect("on_increment_score", change_score)#cada vez que se emita la señal se cambia el score
	#Global.increment_score("on_increment_score",change_score())
func _process(delta: float) -> void:
	#$lPuntuacion.text = str(Global.score) #cojo la puntuacion la paso a texto y se la asigno al score
	pass

#si se pulsa el espacio empieza el juego 
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if Global.is_start == false:
				Global.start_game()


func change_score():
	$lPuntuacion.text = str(Global.score)

func start_game():
	$Mensaje.hide()
