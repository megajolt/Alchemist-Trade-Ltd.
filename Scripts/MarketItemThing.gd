extends Control

@onready var currentStock = get_meta("Stock")
@onready var price = get_meta("Price")
@onready var hudNode=$"/root/Node3D/Camera3D/HUD"
@onready var stockList=$"/root/Node3D/Camera3D/StockUi/Ingredients"
@onready var descriptionNode = $"/root/Node3D/Camera3D/MarketUi/Ingredient Info"
var changeAmount=0;
signal item_bought(item_name: String,cost: String,item_description: String,item_pic: String)
# Called when the node enters the scene tree for the first time.
func _ready():
	var ingredients_callable = Callable(stockList, "_on_item_bought")
	self.connect("item_bought",ingredients_callable)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	changeAmount=hudNode.get_meta("ChangeAmount")
	currentStock = get_meta("Stock")
	price=get_meta("Price")
	$"Avail Num".text=str(currentStock)
	$"Cost Num".text=str(price)

func _on_buy_pressed():
	if(currentStock>0):
		currentStock-=1
		set_meta("Stock",currentStock)
		changeAmount-=int($"Cost Num".text)
		hudNode.set_meta("ChangeAmount",changeAmount)
		hudNode.set_meta("MoneyChange",true)
		item_bought.emit($"Ingredient Title".text,$"Cost Num".text,get_meta("IngredientDescription"),get_meta("PicPath"))


func _on_button_pressed():
	var ingredientName = descriptionNode.get_node("Ingredient Name")
	var ingredientCost = descriptionNode.get_node("Cost")
	var ingredientDescription=descriptionNode.get_node("Ingredient Description")
	ingredientName.text=$"Ingredient Title".text
	ingredientCost.text=$"Cost Num".text
	ingredientDescription.text=get_meta("IngredientDescription")
	descriptionNode.get_node("Ingredient Image").texture=load(get_meta("PicPath"))
	
