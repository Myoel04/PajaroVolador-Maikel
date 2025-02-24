extends CanvasLayer

func _ready() -> void:
	Global.connect("on_increment_score", change_score)#cada vez que se emita la señal se cambia el score
	#Global.increment_score("on_increment_score",change_score())
	Global.connect("on_game_over", game_over) #escuchar señal
	Global.connect("on_game_start",start_game)
	$lGameOver.hide() #cuando empieza el gameover escondido
	$Mensaje.show() #se muestra el menu inicio
	esconderNivel()
	get_tree().paused = false  #para comenzar de nuevo  
#esconder los niveles
func esconderNivel():
	$lNv1.hide()
	$lNv2.hide()
	$lNv3.hide()

func _process(delta: float) -> void:
	#$lPuntuacion.text = str(Global.score) #cojo la puntuacion la paso a texto y se la asigno al score
	pass

#si se pulsa el espacio empieza el juego 
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if not Global.is_start : ##==false
				Global.start_game()
				#start_game()

#acutalización del nivel
func update_level_display():
	$lNv1.hide()
	$lNv2.hide()
	$lNv3.hide()
	match Global.nivel_actual:
		1:
			$lNv1.show()
		2:
			$lNv2.show()
		3:
			$lNv3.show()

#cambiar la puntuacion
func change_score():
	$lPuntuacion.text = str(Global.score)
	update_level_display()

#funcion de qeu empiece el juego
func start_game():
	$Mensaje.hide()
	update_level_display()

#funcion cuando acaba el juego
func game_over():
	$lGameOver.show() #muestro el mensaje de "GameOver"
	await get_tree().create_timer(2).timeout #tiempo de mostrar el mensaje
	get_tree().reload_current_scene() ##ejecuta toda la escena de nuevo
