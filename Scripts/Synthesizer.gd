extends Control


var botIngredientPanel
var topIngredientPanel

var itemList1Ingredients = ["","","",""]
var itemList1IngredientIndices=[null,null,null,null]
var recipe1=""
var recipe1Desc=""

var itemList2Ingredients = ["","","",""]
var itemList2IngredientIndices=[null,null,null,null]
var recipe2=""
var recipe2Desc=""

var itemList3Ingredients = ["","","",""]
var itemList3IngredientIndices=[null,null,null,null]
var recipe3=""
var recipe3Desc=""

var itemList4Ingredients = ["","","",""]
var itemList4IngredientIndices=[null,null,null,null]
var recipe4=""
var recipe4Desc=""

var time1=[0,0,0]
var time2=[0,0,0]
var time3=[0,0,0]
var time4=[0,0,0]

var image = Image.load_from_file("res://2DAssets/smallFrame.png")
var defTex = ImageTexture.create_from_image(image)

@onready var validRecipes = get_meta("ValidRecipes")
@onready var recipeNames = get_meta("RecipeNames")
@onready var recipeHours = get_meta("RecipeHours")
@onready var recipeMins = get_meta("RecipeMins")
@onready var recipeSecs = get_meta("RecipeSecs")
@onready var stockList=$"/root/Node3D/Camera3D/StockUi/Ingredients"
@onready var item_names=$"/root/Node3D/Camera3D/StockUi/Ingredients".get_meta("ItemNames")
@onready var item_costs=$"/root/Node3D/Camera3D/StockUi/Ingredients".get_meta("ItemCosts")
@onready var item_descriptions=$"/root/Node3D/Camera3D/StockUi/Ingredients".get_meta("ItemDescriptions")

var recipe_descriptions=["By combining several different metals to create a box, create an impenetrable container for all kinds of items."
,"An alloy of Gold and Platinum, surrounded in a Rubber coating."
,"Extra strength cleaning solution used to cull even the worst stains."
,"A nearly ever burning source of fuel, useful for trash disposal."
,"A small reactor for use within conventional homes or for use in a generator."
,"Use of organic components combined with a focused infusion of Oxygen to create an incredibly efficient fertilizer."
,"An extremely effective pesticide, rat poison, and all purpose poison. Usable in Gaseous, Liquid and Solid form."
,"Pipes created by combining multiple corrosion-proof metals."
,"A small disk of gold which can hold large amounts of data within ruby red channels."
,"A Banana Split sundae, probably... definitely."
,"Packing Peanuts combined with rubber to craft a packing material capable of shielding any item."
,"An intravenous concoction which imbues the user with an intense strength from adrenaline."
,"Small mobile automaton, remotely controlled."
,"Someone always needs a pack of 100."
,"A huge coat capable of protecting the average citizen from harsh acid rain near factory cities."
,"A small thumb sized pouch of a mix which makes the user harder to detect."
,"Standard building material for modern structures."
,"Used for pasta."
,"A popular item for standard menial workers."
,"A small cube with an immense mass. Popular as a paperweight."]

signal item_bought(item_name: String,cost: String,item_description: String)
# Called when the node enters the scene tree for the first time.
func _ready():
	botIngredientPanel = $BotIngredientWindow
	topIngredientPanel = $TopIngredientWindow
	var ingredients_callable = Callable(stockList, "_on_item_bought")
	self.connect("item_bought",ingredients_callable)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	item_names=$"/root/Node3D/Camera3D/StockUi/Ingredients".get_meta("ItemNames")
	item_costs=$"/root/Node3D/Camera3D/StockUi/Ingredients".get_meta("ItemCosts")
	item_descriptions=$"/root/Node3D/Camera3D/StockUi/Ingredients".get_meta("ItemDescriptions")
	if(time1[0]>0||time1[1]>0||time1[2]>0):
		$TextureRect1/Timer1.show()
		$TextureRect1/Timer1.text=str(time1[0])+":"+str(time1[1])+":"+str(time1[2])
		_countDown1(time1[0],time1[1],time1[2])
	if(time2[0]>0||time2[1]>0||time2[2]>0):
		$TextureRect2/Timer2.show()
		$TextureRect2/Timer2.text=str(time2[0])+":"+str(time2[1])+":"+str(time2[2])
		_countDown2(time2[0],time2[1],time2[2])
	if(time3[0]>0||time3[1]>0||time3[2]>0):
		$TextureRect3/Timer3.show()
		$TextureRect3/Timer3.text=str(time3[0])+":"+str(time3[1])+":"+str(time3[2])
		_countDown3(time3[0],time3[1],time3[2])
	if(time4[0]>0||time4[1]>0||time4[2]>0):
		$TextureRect4/Timer4.show()
		$TextureRect4/Timer4.text=str(time4[0])+":"+str(time4[1])+":"+str(time4[2])
		_countDown4(time4[0],time4[1],time4[2])
	if(time1[0]==0&&time1[1]==0&&time1[2]==0):
		$TextureRect1/Timer1.hide()
	if(time2[0]==0&&time2[1]==0&&time2[2]==0):
		$TextureRect2/Timer2.hide()
	if(time3[0]==0&&time3[1]==0&&time3[2]==0):
		$TextureRect3/Timer3.hide()
	if(time4[0]==0&&time4[1]==0&&time4[2]==0):
		$TextureRect4/Timer4.hide()

func _on_button_1_pressed():
	for j in range($TextureRect1/ItemList1.get_item_count()):
		$TextureRect1/ItemList1.set_item_icon(j,defTex)
	if(botIngredientPanel.visible):
		for i in range(validRecipes.size()):
			if(validRecipes[i]==itemList1Ingredients):
				print("Recipe"+str(validRecipes[i]))
				recipe1=recipeNames[i]
				recipe1Desc=recipe_descriptions[i]
				print(get_meta("ItemIndexList"))
				remove_items()
				time1[0]=0
				time1[1]=0
				time1[2]=10
				break
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
	itemList1Ingredients=["","","",""]

func _on_button_2_pressed():
	for j in range($TextureRect2/ItemList2.get_item_count()):
		$TextureRect2/ItemList2.set_item_icon(j,defTex)
	if(botIngredientPanel.visible):
		for i in range(validRecipes.size()):
			if(validRecipes[i]==itemList1Ingredients):
				print("Recipe"+str(validRecipes[i]))
				recipe2=recipeNames[i]
				recipe2Desc=recipe_descriptions[i]
				time2[0]=0
				time2[1]=0
				time2[2]=10
				break
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
	for j in range($TextureRect3/ItemList3.get_item_count()):
		$TextureRect3/ItemList3.set_item_icon(j,defTex)
	if(topIngredientPanel.visible):
		for i in range(validRecipes.size()):
			if(validRecipes[i]==itemList1Ingredients):
				print("Recipe"+str(validRecipes[i]))
				recipe3=recipeNames[i]
				recipe3Desc=recipe_descriptions[i]
				time3[0]=0
				time3[1]=0
				time3[2]=10
				break
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
	for j in range($TextureRect4/ItemList4.get_item_count()):
		$TextureRect4/ItemList4.set_item_icon(j,defTex)
	if(topIngredientPanel.visible):
		for i in range(validRecipes.size()):
			if(validRecipes[i]==itemList1Ingredients):
				print("Recipe"+str(validRecipes[i]))
				recipe4=recipeNames[i]
				recipe4Desc=recipe_descriptions[i]
				time4[0]=0
				time4[1]=0
				time4[2]=10
				break
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

func _countDown1(hour,min,sec):
	if($/root/Node3D/Camera3D/HUD/FFWD.button_pressed):
		sec=sec-4
	if($/root/Node3D/Camera3D/HUD/Pause.button_pressed):
		sec=sec
	else:
		sec=sec-2
	if(sec<=0&&min>0):
		sec=60
		min=min-1
	elif(sec<=0):
		sec=0
	if(min<=0&&hour>0):
		min=60
		hour=hour-1
	elif(min<=0):
		min=0
	time1[0]=hour
	time1[1]=min
	time1[2]=sec
	if(hour==0&&min==0&&sec==0):
		_add_to_stock("slot1")

func _countDown2(hour,min,sec):
	if($/root/Node3D/Camera3D/HUD/FFWD.button_pressed):
		sec=sec-4
	if($/root/Node3D/Camera3D/HUD/Pause.button_pressed):
		sec=sec
	else:
		sec=sec-2
	if(sec<=0&&min>0):
		sec=60
		min=min-1
	elif(sec<=0):
		sec=0
	if(min<=0&&hour>0):
		min=60
		hour=hour-1
	elif(min<=0):
		min=0
	time2[0]=hour
	time2[1]=min
	time2[2]=sec
	if(hour==0&&min==0&&sec==0):
		_add_to_stock("slot2")

func _countDown3(hour,min,sec):
	if($/root/Node3D/Camera3D/HUD/FFWD.button_pressed):
		sec=sec-4
	if($/root/Node3D/Camera3D/HUD/Pause.button_pressed):
		sec=sec
	else:
		sec=sec-2
	if(sec<=0&&min>0):
		sec=60
		min=min-1
	elif(sec<=0):
		sec=0
	if(min<=0&&hour>0):
		min=60
		hour=hour-1
	elif(min<=0):
		min=0
	time3[0]=hour
	time3[1]=min
	time3[2]=sec
	if(hour==0&&min==0&&sec==0):
		_add_to_stock("slot3")

func _countDown4(hour,min,sec):
	if($/root/Node3D/Camera3D/HUD/FFWD.button_pressed):
		sec=sec-4
	if($/root/Node3D/Camera3D/HUD/Pause.button_pressed):
		sec=sec
	else:
		sec=sec-2
	if(sec<=0&&min>0):
		sec=60
		min=min-1
	elif(sec<=0):
		sec=0
	if(min<=0&&hour>0):
		min=60
		hour=hour-1
	elif(min<=0):
		min=0
	time4[0]=hour
	time4[1]=min
	time4[2]=sec
	if(hour==0&&min==0&&sec==0):
		_add_to_stock("slot4")
		

func _add_to_stock(fromSlot):
	if(fromSlot=="slot1"):
		print(recipe1)
		item_bought.emit(recipe1,str(0),recipe1Desc)
	elif(fromSlot=="slot2"):
		print(recipe2)
		item_bought.emit(recipe2,str(0),recipe2Desc)
	elif(fromSlot=="slot3"):
		print(recipe3)
		item_bought.emit(recipe3,str(0),recipe3Desc)
	elif(fromSlot=="slot4"):
		print(recipe4)
		item_bought.emit(recipe4,str(0),recipe4Desc)
func remove_items():
	for j in get_meta("ItemIndexList"):
		$BotIngredientWindow/ItemList.set_item_text(j,str(int($BotIngredientWindow/ItemList.get_item_text(j))-1))
		$TopIngredientWindow/ItemList.set_item_text(j,str(int($TopIngredientWindow/ItemList.get_item_text(j))-1))
		$/root/Node3D/Camera3D/StockUi/Ingredients/ItemList.set_item_text(j,str(int($/root/Node3D/Camera3D/StockUi/Ingredients/ItemList.get_item_text(j))-1))
	var item_count = $BotIngredientWindow/ItemList.get_item_count()
	for j in range(item_count - 1, -1, -1):
		if(int($BotIngredientWindow/ItemList.get_item_text(j))==0):
			$BotIngredientWindow/ItemList.remove_item(j)
			$TopIngredientWindow/ItemList.remove_item(j)
			$/root/Node3D/Camera3D/StockUi/Ingredients/ItemList.remove_item(j)
			item_costs.remove_at(j)
			item_descriptions.remove_at(j)
			item_names.remove_at(j)
			$"/root/Node3D/Camera3D/StockUi/Ingredients".set_meta("ItemNames",item_names)
			$"/root/Node3D/Camera3D/StockUi/Ingredients".set_meta("ItemCosts",item_costs)
			$"/root/Node3D/Camera3D/StockUi/Ingredients".set_meta("ItemDescriptions",item_descriptions)

func _on_item_list_1_item_selected(index):
	itemList1Ingredients[index]=botIngredientPanel.get_meta("SelectedItemName")
	$TextureRect1/ItemList1.set_item_icon(index,botIngredientPanel.get_meta("ItemImageData"))
	print(itemList1Ingredients)
	botIngredientPanel.set_meta("ItemImageData",defTex)
	botIngredientPanel.set_meta("SelectedItemName","")
	itemList1IngredientIndices[index]=botIngredientPanel.get_meta("ItemIndex")
	set_meta("ItemIndexList",itemList1IngredientIndices)

func _on_item_list_2_item_selected(index):
	itemList2Ingredients[index]=botIngredientPanel.get_meta("SelectedItemName")
	$TextureRect2/ItemList2.set_item_icon(index,botIngredientPanel.get_meta("ItemImageData"))
	print(itemList2Ingredients)
	botIngredientPanel.set_meta("ItemImageData",defTex)
	botIngredientPanel.set_meta("SelectedItemName","")

func _on_item_list_3_item_selected(index):
	itemList3Ingredients[index]=topIngredientPanel.get_meta("SelectedItemName")
	$TextureRect3/ItemList3.set_item_icon(index,topIngredientPanel.get_meta("ItemImageData"))
	print(itemList3Ingredients)
	botIngredientPanel.set_meta("ItemImageData",defTex)
	botIngredientPanel.set_meta("SelectedItemName","")

func _on_item_list_4_item_selected(index):
	itemList4Ingredients[index]=topIngredientPanel.get_meta("SelectedItemName")
	$TextureRect4/ItemList4.set_item_icon(index,topIngredientPanel.get_meta("ItemImageData"))
	print(itemList4Ingredients)
	botIngredientPanel.set_meta("ItemImageData",defTex)
	botIngredientPanel.set_meta("SelectedItemName","")
