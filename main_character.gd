extends CharacterBody2D

@export var speed = 120.0
@export var jump_force = -350.0
@export var gravity = 1000.0
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	var direction = Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * speed
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if !is_on_floor():
		sprite.play("Jump")
	elif direction != 0:
		sprite.play("Walk")
	else:
		sprite.play("Ideal")

	move_and_slide()
