extends Control

@onready var stockList = $/root/Node3D/Camera3D/StockUi/Ingredients/ItemList
@onready var stock= $/root/Node3D/Camera3D/StockUi/Ingredients

@onready var hudNode=$/root/Node3D/Camera3D/HUD
@onready var contractNode=$/root/Node3D/Camera3D/HUD/Contracts
@onready var bottomWindowList=$/root/Node3D/Camera3D/SynthesizerUi/BotIngredientWindow/ItemList
@onready var topWindowList=$/root/Node3D/Camera3D/SynthesizerUi/TopIngredientWindow/ItemList
var changeAmount=0;

signal contractFulfilled(path: String)
# Called when the node enters the scene tree for the first time.
func _ready():
	var ingredients_callable = Callable(contractNode, "_on_contract_fulfilled")
	self.connect("contractFulfilled",ingredients_callable)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	changeAmount=hudNode.get_meta("ChangeAmount")


func _on_full_fill_pressed():
	var items=0
	var stockNames = stock.get_meta("ItemNames")
	for i in range(stockList.get_item_count()):
		for j in range($ItemList.get_item_count()):
			if($ItemList.get_item_text(j)==stockNames[i]):
				items+=1
	if(items==$ItemList.get_item_count()):
		changeAmount+=int($Reward.text)
		hudNode.set_meta("ChangeAmount",changeAmount)
		hudNode.set_meta("MoneyChange",true)
		for i in range(stockList.get_item_count()):
			for j in range($ItemList.get_item_count()):
				if($ItemList.get_item_text(j)==stockNames[i]):
					stockList.set_item_text(i,str(int(stockList.get_item_text(i))-1))
					bottomWindowList.set_item_text(i,str(int(bottomWindowList.get_item_text(i))-1))
					topWindowList.set_item_text(i,str(int(topWindowList.get_item_text(i))-1))
	var item_costs=stock.get_meta("ItemCosts")
	var item_descriptions=stock.get_meta("ItemDescriptions")
	var item_names=stock.get_meta("ItemNames")
	if(item_costs.size()>0):
		for j in range($ItemList.get_item_count() - 1, -1, -1):
			if(int(bottomWindowList.get_item_text(j))==0):
				bottomWindowList.remove_item(j)
				topWindowList.remove_item(j)
				stockList.remove_item(j)
				item_costs.remove_at(j)
				item_descriptions.remove_at(j)
				item_names.remove_at(j)
				stock.set_meta("ItemNames",item_names)
				stock.set_meta("ItemCosts",item_costs)
				stock.set_meta("ItemDescriptions",item_descriptions)
	
