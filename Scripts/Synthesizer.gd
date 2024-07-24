extends Control


var botIngredientPanel
var topIngredientPanel
var itemList1Ingredients = ["","","",""]
var itemList2Ingredients = ["","","",""]
var itemList3Ingredients = ["","","",""]
var itemList4Ingredients = ["","","",""]

# Called when the node enters the scene tree for the first time.
func _ready():
	botIngredientPanel = $BotIngredientWindow
	topIngredientPanel = $TopIngredientWindow


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	print("Button1")
	botIngredientPanel.visible=!botIngredientPanel.visible
	$TextureRect2/Button2.disabled=!$TextureRect2/Button2.disabled
	$TextureRect3/Button3.disabled=!$TextureRect3/Button3.disabled
	$TextureRect4/Button4.disabled=!$TextureRect4/Button4.disabled
	for i in range($TextureRect2/ItemList2.get_item_count()):
		$TextureRect2/ItemList2.set_item_disabled(i,!$TextureRect2/ItemList2.is_item_disabled(i))
	for i in range($TextureRect3/ItemList3.get_item_count()):
		$TextureRect3/ItemList3.set_item_disabled(i,!$TextureRect3/ItemList3.is_item_disabled(i))
	for i in range($TextureRect4/ItemList4.get_item_count()):
		$TextureRect4/ItemList4.set_item_disabled(i,!$TextureRect4/ItemList4.is_item_disabled(i))


func _on_button_2_pressed():
	print("Button2")
	botIngredientPanel.visible=!botIngredientPanel.visible
	$TextureRect1/Button1.disabled=!$TextureRect1/Button1.disabled
	$TextureRect3/Button3.disabled=!$TextureRect3/Button3.disabled
	$TextureRect4/Button4.disabled=!$TextureRect4/Button4.disabled
	for i in range($TextureRect1/ItemList1.get_item_count()):
		$TextureRect1/ItemList1.set_item_disabled(i,!$TextureRect1/ItemList1.is_item_disabled(i))
	for i in range($TextureRect3/ItemList3.get_item_count()):
		$TextureRect3/ItemList3.set_item_disabled(i,!$TextureRect3/ItemList3.is_item_disabled(i))
	for i in range($TextureRect4/ItemList4.get_item_count()):
		$TextureRect4/ItemList4.set_item_disabled(i,!$TextureRect4/ItemList4.is_item_disabled(i))
	
func _on_button_3_pressed():
	print("Button3")
	topIngredientPanel.visible=!topIngredientPanel.visible
	$TextureRect1/Button1.disabled=!$TextureRect1/Button1.disabled
	$TextureRect2/Button2.disabled=!$TextureRect2/Button2.disabled
	$TextureRect4/Button4.disabled=!$TextureRect4/Button4.disabled
	for i in range($TextureRect1/ItemList1.get_item_count()):
		$TextureRect1/ItemList1.set_item_disabled(i,!$TextureRect1/ItemList1.is_item_disabled(i))
	for i in range($TextureRect2/ItemList2.get_item_count()):
		$TextureRect2/ItemList2.set_item_disabled(i,!$TextureRect2/ItemList2.is_item_disabled(i))
	for i in range($TextureRect4/ItemList4.get_item_count()):
		$TextureRect4/ItemList4.set_item_disabled(i,!$TextureRect4/ItemList4.is_item_disabled(i))
	


func _on_button_4_pressed():
	print("Button4")
	topIngredientPanel.visible=!topIngredientPanel.visible
	$TextureRect1/Button1.disabled=!$TextureRect1/Button1.disabled
	$TextureRect2/Button2.disabled=!$TextureRect2/Button2.disabled
	$TextureRect3/Button3.disabled=!$TextureRect3/Button3.disabled
	for i in range($TextureRect1/ItemList1.get_item_count()):
		$TextureRect1/ItemList1.set_item_disabled(i,!$TextureRect1/ItemList1.is_item_disabled(i))
	for i in range($TextureRect2/ItemList2.get_item_count()):
		$TextureRect2/ItemList2.set_item_disabled(i,!$TextureRect2/ItemList2.is_item_disabled(i))
	for i in range($TextureRect3/ItemList3.get_item_count()):
		$TextureRect3/ItemList3.set_item_disabled(i,!$TextureRect3/ItemList3.is_item_disabled(i))

func _on_item_list_1_item_selected(index):
	itemList1Ingredients[index]=botIngredientPanel.get_meta("SelectedItemName")
	$TextureRect1/ItemList1.set_item_icon(index,botIngredientPanel.get_meta("ItemImageData"))
	


func _on_item_list_2_item_selected(index):
	itemList2Ingredients[index]=botIngredientPanel.get_meta("SelectedItemName")
	$TextureRect2/ItemList2.set_item_icon(index,botIngredientPanel.get_meta("ItemImageData"))

func _on_item_list_3_item_selected(index):
	itemList3Ingredients[index]=topIngredientPanel.get_meta("SelectedItemName")
	$TextureRect3/ItemList3.set_item_icon(index,topIngredientPanel.get_meta("ItemImageData"))

func _on_item_list_4_item_selected(index):
	itemList4Ingredients[index]=topIngredientPanel.get_meta("SelectedItemName")
	$TextureRect4/ItemList4.set_item_icon(index,topIngredientPanel.get_meta("ItemImageData"))
