extends Camera3D

var ChairSounds = AudioStreamPlayer3D.new()
var ChairSoundPaths = ["res://Audio/chair-squeak-bed-spring-sample-1_C_minor.wav","res://Audio/chair-squeak-bed-spring-sample-2_C_minor.wav","res://Audio/chair-squeak-bed-spring-sample-3_C_minor.wav"]

var target_rot=null
var rotating = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_child(ChairSounds)

func _play_sound():
	var ChairSoundPath = ChairSoundPaths.pick_random()
	ChairSounds.stream=load(ChairSoundPath)
	ChairSounds.play()

func _rotate():
	if $"HUD/Rotate Left".button_pressed:
		$"HUD/Rotate Left".button_pressed = false
		$"HUD/Rotate Left".disabled = true
		target_rot = transform.basis.orthonormalized().rotated(Vector3(0, 1, 0), -PI / 2)
		rotating = true
		_play_sound()
		
	if $"HUD/Rotate Right".button_pressed:
		$"HUD/Rotate Right".button_pressed = false
		$"HUD/Rotate Right".disabled = true
		target_rot = transform.basis.orthonormalized().rotated(Vector3(0, 1, 0), PI / 2)
		rotating = true
		_play_sound()

func _process(delta):
	_rotate()
	if rotating and target_rot != null:
		var current_rot = Quaternion(transform.basis.orthonormalized())
		var rotation_delta = target_rot.slerp(current_rot.normalized(), .2)
		transform.basis = Basis(rotation_delta)
		
		# Compute the angle difference between current and target rotations
		var angle_diff=current_rot.angle_to(target_rot)
		
		if angle_diff < 0.01:
			rotating = false
			target_rot = null
			$"HUD/Rotate Left".disabled = false
			$"HUD/Rotate Right".disabled = false
