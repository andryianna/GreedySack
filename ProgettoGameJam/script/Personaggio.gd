extends CharacterBody2D

const SPEED = 300.0
var pila = preload("res://scene/monete_pila.tscn")

var key = false

var weight_modifier = 1:
	set(value):
		if value <= 2.25:
			weight_modifier = value
			jump_velocity = -400.0 / weight_modifier
			scale = Vector2(value, value)
var jump_velocity = -400.0 / weight_modifier

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta: float) -> void:
	#Reset Livello
	if Input.is_action_just_pressed("restart_level"):
		get_tree().reload_current_scene()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	#Codice per svuotarsi
	if Input.is_action_just_pressed("svuota"):
		crea_pila(weight_modifier)
		weight_modifier = 1
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func crea_pila(weight):
	if weight > 1:
		var pila_instance = pila.instantiate()
		pila_instance.numero_monete = (weight - 1) / 0.05
		pila_instance.position = position
		get_parent().add_child(pila_instance)
