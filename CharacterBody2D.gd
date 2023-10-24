extends CharacterBody2D
var speed = 200 
var animated_dir = "_down"
var status_a = "idel"

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	
func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		status_a = "move"
		animated_dir = "_left"
	elif Input.is_action_pressed("ui_right"):
		status_a = "move"
		animated_dir = "_right"
	elif Input.is_action_pressed("ui_up"):
		status_a = "move"
		animated_dir = "_up"
	elif Input.is_action_pressed("ui_down"):
		status_a = "move"
		animated_dir = "_down"
	else:
		status_a = "idel"
		animated_dir = ""
	print(status_a + animated_dir)
	get_node("AnimatedSprite2D").play(status_a + animated_dir )
	



