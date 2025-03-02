extends CanvasLayer

#INICIALIZA AL CARGARSE EL NODO, CONECTA SEÑALES Y PREPARA MENU
func _ready() -> void:
	Global.connect("on_increment_score", change_score)
	Global.connect("on_game_over", game_over) 
	Global.connect("on_game_start",start_game)
	$lGameOver.hide()
	$Mensaje.show() 
	esconderNivel()
	$lPuntuacion2.hide()
	get_tree().paused = false  #para comenzar de nuevo  


#ESCONDER LOS NIVELES EN EL MENU
func esconderNivel():
	$lNv1.hide()
	$lNv2.hide()
	$lNv3.hide()

func _process(delta: float) -> void:
	#$lPuntuacion.text = str(Global.score) #cojo la puntuacion la paso a texto y se la asigno al score
	pass

#EMPEZAR EL JUEGO CON EL ESPACIO O RATÓN
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if not Global.is_start : ##==false
				Global.start_game()

#acutalización de vista del nivel
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

#actualizar la puntuacion mostrada
func change_score():
	$lPuntuacion.text = str(Global.score)
	update_level_display()

#funcion de empezar el juego
func start_game():
	$Mensaje.hide()
	update_level_display()

#funcion cuando acaba el juego para mostrar y ocultar labels
func game_over():
	$lGameOver.show() # Muestra el mensaje de "GameOver"
	$lPuntuacion.hide() # Oculta la puntuación actual
	$lPuntuacion2.show() # Muestra la puntuación total
	$lPuntuacion2.text = "Total " + str(Global.score) # Actualiza el texto con el puntaje final
	await get_tree().create_timer(2).timeout # Tiempo para mostrar el mensaje
	get_tree().reload_current_scene() # Reinicia la escena
