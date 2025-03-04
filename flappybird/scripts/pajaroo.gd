extends CharacterBody2D  # Extiende de CharacterBody2D, proporcionando funcionalidades para manejar cuerpos con físicas.
class_name Pajaro  # Declara un nombre de clase para el nodo, permitiendo su uso como tipo en otros scripts.

const JUMP_VELOCITY = -300.0  # Constante que define la velocidad de salto del pájaro.

# CONFIGURACIÓN GRAVEDAD
# Maneja la física del pájaro, aplicando gravedad y permitiendo el salto.
func _physics_process(delta: float) -> void:
	if Global.is_start:
		if not is_on_floor():
			velocity += get_gravity() * delta

		# CONFIGURACIÓN DEL SALTO CON EL ESPACIO
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			rotation = deg_to_rad(-40)  # Rota el pájaro hacia arriba al saltar.
			$AudioAleteo.play()

	# MOVER EL PAJARO SEGÚN VELOCIDAD Y FÍSICA APLICADO
	move_and_slide()  
	rotacion_pajaro()  

# rotación del pájaro hacia arriba/abajo
# Ajusta la rotación del pájaro basándose en su velocidad vertical.
func rotacion_pajaro():
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += 2 * deg_to_rad(1)  # Rota hacia abajo si el pájaro está cayendo.
	elif velocity.y > 0 and rad_to_deg(rotation) > -40:
		rotation -= 2 * deg_to_rad(1)  # Rota hacia arriba si el pájaro todavía está subiendo.
