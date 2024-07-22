extends Panel

var image = Image.load_from_file("res://2DAssets/PlaceholderIcon.png")
var texture = ImageTexture.create_from_image(image)

var ingredientInfo
var ingredientName
var ingredientValue
var ingredientDescription

var item_descriptions=[]
var item_names=[]
var item_costs=[]

@onready var hudNode=$"/root/Node3D/Camera3D/HUD"
var changeAmount=0;

func _ready():
	ingredientInfo=$"/root/Node3D/Camera3D/StockUi/Ingredient Info"
	ingredientName=$"/root/Node3D/Camera3D/StockUi/Ingredient Info/Ingredient Name"
	ingredientDescription=$"/root/Node3D/Camera3D/StockUi/Ingredient Info/Ingredient Description"
	ingredientValue=$"/root/Node3D/Camera3D/StockUi/Ingredient Info/Value"

func _on_item_bought(item_name: String,cost: String,item_description: String):
	var itemIndex=item_names.find(item_name)
	if(itemIndex>=0):
		print("item exists")
		$ItemList.set_item_text(itemIndex,str((int($ItemList.get_item_text(itemIndex))+1)))
	else:
		item_names.append(item_name)
		item_descriptions.append(item_description)
		item_costs.append(cost)
		$ItemList.add_item(str(1),texture)


func _process(delta):
	changeAmount=hudNode.get_meta("ChangeAmount")


func _on_item_list_item_selected(index):
	ingredientName.text=item_names[index]
	ingredientDescription.text=item_descriptions[index]
	ingredientValue.text=item_costs[index]


func _on_sell_pressed():
	changeAmount+=int(ingredientValue.text)
	hudNode.set_meta("ChangeAmount",changeAmount)
	hudNode.set_meta("MoneyChange",true)
	var itemIndex=item_names.find(ingredientName.text)
	$ItemList.set_item_text(itemIndex,str((int($ItemList.get_item_text(itemIndex))-1)))
	if(int($ItemList.get_item_text(itemIndex))==0):
		$ItemList.remove_item(itemIndex)
		item_costs.remove_at(itemIndex)
		item_descriptions.remove_at(itemIndex)
		item_names.remove_at(itemIndex)
	
