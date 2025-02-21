extends CharacterBody2D
class_name Pajaro

const SPEED = 300.0
const JUMP_VELOCITY = -300.0 #salto que hace el pajaro

#CONFIGURACION GRAVEDAD
func _physics_process(delta: float) -> void:
	if Global.is_start:
		if not is_on_floor():
			velocity += get_gravity() * delta
#CONFIGURACION DEL SALTO 
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY


	move_and_slide() #sin esto no se mueve el pajaro
