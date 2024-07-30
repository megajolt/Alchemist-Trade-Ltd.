extends Panel

var ingredientInfo
var ingredientName
var ingredientValue
var ingredientDescription
var ingredientImage
var synthesizerTopList
var synthesizerBottomList
var synthesizerTop
var synthesizerBottom

var item_descriptions=[]
var item_names=[]
var item_costs=[]
var item_pics=[]

@onready var hudNode=$"/root/Node3D/Camera3D/HUD"
var changeAmount=0;

func _ready():
	ingredientInfo=$"/root/Node3D/Camera3D/StockUi/Ingredient Info"
	ingredientName=$"/root/Node3D/Camera3D/StockUi/Ingredient Info/Ingredient Name"
	ingredientImage=$"/root/Node3D/Camera3D/StockUi/Ingredient Info/Ingredient Image"
	ingredientDescription=$"/root/Node3D/Camera3D/StockUi/Ingredient Info/Ingredient Description"
	ingredientValue=$"/root/Node3D/Camera3D/StockUi/Ingredient Info/Value"
	synthesizerBottomList=$"/root/Node3D/Camera3D/SynthesizerUi/BotIngredientWindow/ItemList"
	synthesizerTopList=$"/root/Node3D/Camera3D/SynthesizerUi/TopIngredientWindow/ItemList"
	synthesizerBottom=$"/root/Node3D/Camera3D/SynthesizerUi/BotIngredientWindow"
	synthesizerTop=$"/root/Node3D/Camera3D/SynthesizerUi/TopIngredientWindow"

func _on_item_bought(item_name: String,cost: String,item_description: String,item_pic: String):
	var itemIndex=item_names.find(item_name)
	var texture = load(item_pic)
	if(itemIndex>=0):
		print("item exists")
		$ItemList.set_item_text(itemIndex,str((int($ItemList.get_item_text(itemIndex))+1)))
		synthesizerBottomList.set_item_text(itemIndex,str((int(synthesizerBottomList.get_item_text(itemIndex))+1)))
		synthesizerTopList.set_item_text(itemIndex,str((int(synthesizerTopList.get_item_text(itemIndex))+1)))
	else:
		item_names.append(item_name)
		set_meta("ItemNames",item_names)
		item_descriptions.append(item_description)
		set_meta("ItemDescriptions",item_descriptions)
		item_costs.append(cost)
		set_meta("ItemCosts",item_costs)
		item_pics.append(item_pic)
		set_meta("ItemCosts",item_pics)
		$ItemList.add_item(str(1),texture)
		synthesizerTopList.add_item(str(1),texture)
		synthesizerBottomList.add_item(str(1),texture)


func _process(delta):
	changeAmount=hudNode.get_meta("ChangeAmount")
	synthesizerTop.set_meta("IngredientList",item_names)
	synthesizerBottom.set_meta("IngredientList",item_names)


func _on_item_list_item_selected(index):
	ingredientName.text=item_names[index]
	ingredientDescription.text=item_descriptions[index]
	ingredientValue.text=item_costs[index]
	ingredientImage.texture=load(item_pics[index])
	


func _on_sell_pressed():
	changeAmount+=int(ingredientValue.text)
	hudNode.set_meta("ChangeAmount",changeAmount)
	hudNode.set_meta("MoneyChange",true)
	var itemIndex=item_names.find(ingredientName.text)
	$ItemList.set_item_text(itemIndex,str((int($ItemList.get_item_text(itemIndex))-1)))
	synthesizerBottomList.set_item_text(itemIndex,str((int(synthesizerBottomList.get_item_text(itemIndex))-1)))
	synthesizerTopList.set_item_text(itemIndex,str((int(synthesizerTopList.get_item_text(itemIndex))-1)))
	if(int($ItemList.get_item_text(itemIndex))==0):
		$ItemList.remove_item(itemIndex)
		synthesizerBottomList.remove_item(itemIndex)
		synthesizerTopList.remove_item(itemIndex)
		item_costs.remove_at(itemIndex)
		set_meta("ItemCosts",item_costs)
		item_descriptions.remove_at(itemIndex)
		set_meta("ItemDescriptions",item_descriptions)
		item_names.remove_at(itemIndex)
		set_meta("ItemNames",item_names)
	
