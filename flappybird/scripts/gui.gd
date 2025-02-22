extends CanvasLayer

func _ready() -> void:
	Global.connect("on_increment_score", change_score)#cada vez que se emita la señal se cambia el score
	#Global.increment_score("on_increment_score",change_score())
	Global.connect("on_game_over", game_over) #escuchar señal
	$lGameOver.hide() #cuando empieza el gameover escondido
	$Mensaje.show() #se muestra el menu inicio
	get_tree().paused = false  #para comenzar de nuevo  



func _process(delta: float) -> void:
	#$lPuntuacion.text = str(Global.score) #cojo la puntuacion la paso a texto y se la asigno al score
	pass

#si se pulsa el espacio empieza el juego 
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if Global.is_start == false:
				Global.start_game()
				start_game()


func change_score():
	$lPuntuacion.text = str(Global.score)

func start_game():
	$Mensaje.hide()


func game_over():
	$lGameOver.show() #muestro el mensaje de "GameOver"
	await get_tree().create_timer(2).timeout #tiempo de mostrar el mensaje
	get_tree().reload_current_scene() ##ejecuta toda la escena de nuevo
