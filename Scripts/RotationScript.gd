extends Camera3D

var ChairSounds = AudioStreamPlayer3D.new()
var ChairSoundPaths = ["res://Audio/chair-squeak-bed-spring-sample-1_C_minor.wav","res://Audio/chair-squeak-bed-spring-sample-2_C_minor.wav","res://Audio/chair-squeak-bed-spring-sample-3_C_minor.wav"]

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_child(ChairSounds)
	pass # Replace with function body.

func _play_sound():
	var ChairSoundPath = ChairSoundPaths.pick_random()
	ChairSounds.stream=load(ChairSoundPath)
	ChairSounds.play()

func _input(event):
	if(event.is_action_pressed("rotateLeft")):
		rotate_y(-1.57)
		_play_sound()
		
	if(event.is_action_pressed("rotateRight")):
		rotate_y(1.57)
		_play_sound()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
