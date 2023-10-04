extends KinematicBody2D
var input_direction = 0
var direction = 0
var speed = 0
var velocity = 0
const MAX_SPEED = 400
const ACCELERRATION = 700
const DECELERATION = 600


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	# Player input handling
	if input_direction:
		direction = input_direction
	if Input.is_action_pressed("ui_left"):
		input_direction = -1
		get_node("AnimatedSprite").set_flip_h(true)
		get_node("AnimatedSprite").play("move_left")
	elif Input.is_action_pressed("ui_right"):
		input_direction = 1
		get_node("AnimatedSprite").set_flip_h(false)
		get_node("AnimatedSprite").play("move_right")
	else:
		input_direction = 0
		get_node("AnimatedSprite").play("idel")
	if input_direction == -direction:
		speed /= 3
	if input_direction:
		speed += ACCELERRATION * _delta
	else:
		speed -= DECELERATION * _delta
	speed = clamp(speed,0,MAX_SPEED)
	velocity = speed * _delta * direction
	move_and_collide(Vector2(velocity,0))
	pass
