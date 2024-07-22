extends Control

@onready var currentStock = int($"Avail Num".text)
@onready var price = int($"Cost Num".text)
@onready var hudNode=$"/root/Node3D/Camera3D/HUD"
@onready var descriptionNode = $"/root/Node3D/Camera3D/MarketUi/Ingredient Info"
var changeAmount=0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	changeAmount=hudNode.get_meta("ChangeAmount")


func _on_buy_pressed():
	if(currentStock>0):
		currentStock-=1
		$"Avail Num".text=str(currentStock)
		changeAmount-=int($"Cost Num".text)
		hudNode.set_meta("ChangeAmount",changeAmount)
		hudNode.set_meta("MoneyChange",true)
	
	


func _on_button_pressed():
	var ingredientName = descriptionNode.get_node("Ingredient Name")
	var ingredientCost = descriptionNode.get_node("Cost")
	var ingredientDescription=descriptionNode.get_node("Ingredient Description")
	ingredientName.text=$"Ingredient Title".text
	ingredientCost.text=$"Cost Num".text
	ingredientDescription.text=get_meta("IngredientDescription")
	
