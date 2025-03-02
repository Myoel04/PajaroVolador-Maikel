extends CharacterBody2D
class_name Pajaro

const JUMP_VELOCITY = -300.0 #salto que hace el pajaro

#CONFIGURACION GRAVEDAD
func _physics_process(delta: float) -> void:
	if Global.is_start:
		if not is_on_floor():
			velocity += get_gravity() * delta

#CONFIGURACION DEL SALTO CON EL ESPACIO
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		rotation = deg_to_rad(-40) #si presiono espacio se empuja arriba
		$AudioAleteo.play()

#MOVER EL PAJARO SEGUN VELOCIDAD Y FISICA APLICADO
	move_and_slide() #sin esto no se mueve el pajaro
	rotacion_pajaro()

#rotación del pajaro hacia arriba/abajo
func rotacion_pajaro():
	if velocity.y >0 and rad_to_deg(rotation)<90:
		rotation += 2 * deg_to_rad(1)
	elif velocity.y > 0 and rad_to_deg(rotation)>-40:
		rotation -= 2 * deg_to_rad(1)
