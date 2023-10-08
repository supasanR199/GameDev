extends KinematicBody2D

var speed = 200  # speed in pixels/sec
var animated_dir = "_down"
var status_a = "idel"

func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		status_a = "move"
		animated_dir = "_left"
		#get_node("AnimatedSprite").play("move_left")
	elif Input.is_action_pressed("ui_right"):
		status_a = "move"
		animated_dir = "_right"
		#get_node("AnimatedSprite").play("move_right")
	elif Input.is_action_pressed("ui_up"):
		status_a = "move"
		animated_dir = "_top"
		#get_node("AnimatedSprite").play("move_top")
	elif Input.is_action_pressed("ui_down"):
		status_a = "move"
		animated_dir = "_down"
		#get_node("AnimatedSprite").play("move_down")
	else:
		status_a = "idel"
		#get_node("AnimatedSprite").play("idel")
	get_node("AnimatedSprite").play(status_a + animated_dir )

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	print(direction)
	move_and_slide(direction * speed)
