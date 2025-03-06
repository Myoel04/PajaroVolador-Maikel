extends CanvasLayer  # Este script extiende de CanvasLayer, proporcionando funcionalidades para gestionar la interfaz gráfica.

# INICIALIZA AL CARGARSE EL NODO, CONECTA SEÑALES Y PREPARA MENÚ
# Configura la escena cuando el nodo está listo.
func _ready() -> void:
	Global.load_high_score()  # Carga explícitamente el high_score al iniciar.
	Global.connect("on_increment_score", change_score)
	Global.connect("on_game_over", game_over)
	Global.connect("on_game_start", start_game)
	$lGameOver.hide()
	$Mensaje.show()
	esconderNivel()
	$lPuntuacion2.hide()
	if $lScoreCantidad:  # Verifica la existencia del nodo antes de asignar el texto.
		$lScoreCantidad.text = "High Score: " + str(Global.high_score)
		$lScoreCantidad.show()
	else:
		print("Error: No se encontró el nodo $lScoreCantidad en la escena")
	get_tree().paused = false

# ESCONDER LOS NIVELES EN EL MENÚ
# Oculta los labels de los niveles en el menú principal.
func esconderNivel():
	$lNv1.hide()
	$lNv2.hide()
	$lNv3.hide()
	$lNv4

# Procesamiento por frame, no se usa aquí pero es requerido por la sintaxis.
func _process(delta: float) -> void:
	pass

# EMPEZAR EL JUEGO CON EL ESPACIO O RATÓN
# Inicia el juego al detectar la entrada del usuario (espacio o clic del ratón).
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if not Global.is_start:
			Global.start_game()

# ACTUALIZACIÓN DE VISTA DEL NIVEL
# Actualiza la visualización del nivel actual basándose en el estado global.
func update_level_display():
	$lNv1.hide()
	$lNv2.hide()
	$lNv3.hide()
	$lNv4.hide()
	match Global.nivel_actual:
		1:
			$lNv1.show()
		2:
			$lNv2.show()
		3:
			$lNv3.show()
		4:
			$lNv4.show()

# ACTUALIZAR LA PUNTUACIÓN MOSTRADA
# Actualiza el label de puntuación y la visualización del nivel.
func change_score():
	$lPuntuacion.text = str(Global.score)
	update_level_display()

# FUNCIÓN DE EMPEZAR EL JUEGO
# Prepara la interfaz para empezar el juego, ocultando elementos innecesarios.
func start_game():
	$Mensaje.hide()
	$lScoreCantidad.hide()
	update_level_display()

# FUNCIÓN CUANDO ACABA EL JUEGO PARA MOSTRAR Y OCULTAR LABELS
# Gestiona la interfaz cuando el juego termina, muestra resultados y recarga la escena.
func game_over():
	$lGameOver.show()
	$lPuntuacion.hide()
	$lPuntuacion2.show()
	$lPuntuacion2.text = "Total " + str(Global.score)
	if Global.score > Global.high_score:
		Global.update_high_score(Global.score)
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()
