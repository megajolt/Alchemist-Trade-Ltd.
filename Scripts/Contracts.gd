extends Control
@onready var toggle = $"Available Contracts"
@onready var scrollPanel = self
@onready var vBox = $ScrollContainer/VBoxContainer

var contract_scene = preload("res://Scenes/contract.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var num_required = get_parent().get_meta("RequiredContracts")
	num_required += floor(num_required * 0.25)

	for i in range(num_required):
		var contract_instance = contract_scene.instantiate()
		vBox.add_child(contract_instance)
		print("Added contract instance:", i + 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_available_contracts_toggled(toggled_on):
	scrollPanel.visible = !scrollPanel.visible
	pass # Replace with function body.
