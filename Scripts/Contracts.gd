extends Control
@onready var toggle = $"Available Contracts"
@onready var scrollPanel = self
@onready var vBox = $ScrollContainer/VBoxContainer

var rng = RandomNumberGenerator.new()

var contract_scene = preload("res://Scenes/contract.tscn")
var name_list=["Slarbo","Lorafung","Bink","Thara Corpo","Shuni","Pue","Smago","I","Morko","Arbo","Glarry","Bill","Slop Eater","P-der","Nuhm","Moink","Qrork","X-09","Liiple","Kelk"]
var reward = [7485, 2730, 9120, 5730, 4500, 8130, 7530, 9750, 5475, 4305, 4920, 7125, 9045, 5805, 8220, 6120, 6300, 3390, 3480, 9285]
var contract_desc=["I am in need of some Items for disposal. Please provide them."
,"Wires. Many Wires. One Wire?"
,"Prepping for a job. Need these or else."
,"I wanna start up a little garden. Here's what I need."
,"Gonna practice my welding."
,"Setting up a home generator, here's the list."
,"Hungry, I'd like for some snacks!"
,"Looking to do some monitoring."
,"Moving, need some packing materials."
,"My kid wants a toy, get me one."
,"Client of mine needs a couple of items, please get them ASAP."
,"How about a uhhhhhhhhhhhhh..."
,"Trying to make a lighter."
,"Building materials for a new apartment addition. THX!!!"
,"I wanna see how well this thing protects from lightning."
,"Need to offload from my computer."
,"Got a guy I need to help with something."
,"Paperweight time."
,"Need some batteries for my controller"
,"I need some cleaning liquid for my windows. They get all gross from smog."]

var contract_items=[["Exxtra Clean","Sticky Fuel","Mega Box"],["UltraWire"],["DataCoin","Strength Juice","Mobile Tracking Unit","AA Batteries","Poison+"],["Ultra Fertilizer","Large Waterskin (Pre-Filled)","PurePipes"],["PurePipes","Cube Of Mass","1/4 Inch Steel Beam",],["MiniReactor","Mega Box","UltraWire","AA Batteries"],["Sundae","Large Waterskin (Pre-Filled)"],["MegaCoat","Cloak Pouch","Mobile Tracking Unit"],["Extra Strength Peanuts","Mega Box"],["Mobile Tracking Unit","AA Batteries"],["Poison+","Cloak Pouch"],["Salt Water"],["UltraWire","Sticky Fuel","AA Batteries"],["1/4 Inch Steel Beam","PurePipes","UltraWire"],["PurePipes","MegaCoat"],["DataCoin"],["MegaCoat","1/4 Inch Steel Beam","Strength Juice"],["Cube Of Mass"],["AA Batteries"],["Exxtra Clean","Salt Water"]]

# Called when the node enters the scene tree for the first time.
func _ready():
	var num_required = get_parent().get_meta("RequiredContracts")
	num_required += floor(num_required * 0.25)

	for i in range(num_required):
		var contract_instance = contract_scene.instantiate()
		var nameandface=rng.randi_range(0,19)
		var descandreward=rng.randi_range(0,19)
		contract_instance.get_node("Name").text=name_list[nameandface]
		contract_instance.get_node("Reward").text=str(reward[descandreward])
		contract_instance.get_node("Description").text=contract_desc[descandreward]
		for j  in contract_items[descandreward]:
			contract_instance.get_node("ItemList").add_item(j)
		vBox.add_child(contract_instance)


func _on_available_contracts_toggled(toggled_on):
	scrollPanel.visible = !scrollPanel.visible
	pass # Replace with function body.
