extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("rotateLeft")):
		rotate_y(-1.57)
	if(event.is_action_pressed("rotateRight")):
		rotate_y(1.57)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
