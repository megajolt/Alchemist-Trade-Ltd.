extends Camera3D

var ChairSounds = AudioStreamPlayer3D.new()
var ChairSoundPaths = ["res://Audio/chair-squeak-bed-spring-sample-1_C_minor.wav","res://Audio/chair-squeak-bed-spring-sample-2_C_minor.wav","res://Audio/chair-squeak-bed-spring-sample-3_C_minor.wav"]

var target_rot=null
var rotating = false
var rotation_speed=1
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
		target_rot=Quaternion(Vector3(0,1,0),-PI/2)*Quaternion(transform.basis)
		rotating=true
		_play_sound()
		
	if(event.is_action_pressed("rotateRight")):
		target_rot=Quaternion(Vector3(0,1,0),-PI/2)*Quaternion(transform.basis)
		rotating=true
		_play_sound()
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(rotating and target_rot!=null):
		var current_rot=Quaternion(transform.basis)
		current_rot=current_rot.slerp(target_rot,rotation_speed*delta)
		transform.basis = Basis(current_rot)
		if(current_rot.is_equal_approx(target_rot)):
			rotating = false
			target_rot=null
		
	pass
