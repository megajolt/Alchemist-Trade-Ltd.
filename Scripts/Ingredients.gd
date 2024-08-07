extends Panel

@onready var scrollPanel = self
@onready var vBox = $ScrollContainer/VBoxContainer
@onready var stockList=$"/root/Node3D/Camera3D/StockUi/Ingredients"

var ingredient_scene = preload("res://Scenes/MarketItemThing.tscn")
var ingredient_names = ["Copper","Silver","Sulfur","Chlorine","Platinum","Iron","Gold","Cinnamon","Ruby Dust","Uranium","Oxygen","Water","Hydrogen","Salt","Mercury","Coal","Bone Dust","Bananas","Tires","Styrofoam"]
var ingredient_pics = ["res://2DAssets/Ingredients/Copper.png","res://2DAssets/Ingredients/Silver.png","res://2DAssets/Ingredients/Sulfur.png","res://2DAssets/Ingredients/Chlorine.png","res://2DAssets/Ingredients/Platinum.png","res://2DAssets/Ingredients/Iron.png","res://2DAssets/Ingredients/Gold.png","res://2DAssets/Ingredients/Cinnamon.png","res://2DAssets/Ingredients/RubyDust.png","res://2DAssets/Ingredients/Uranium.png","res://2DAssets/Ingredients/Oxygen.png","res://2DAssets/Ingredients/Water.png","res://2DAssets/Ingredients/Hydrogen.png","res://2DAssets/Ingredients/Salt.png","res://2DAssets/Ingredients/Mercury.png","res://2DAssets/Ingredients/Coal.png","res://2DAssets/Ingredients/BoneDust.png","res://2DAssets/Ingredients/Bananas.png","res://2DAssets/Ingredients/Tires.png","res://2DAssets/Ingredients/Styrofoam.png"]
var ingredient_recipes = [['Mega Box', 'PurePipes', 'Mobile Tracking Unit'],['Mega Box'],['Sticky Fuel', 'Ultra Fertilizer', 'Cloak Pouch'],['Exxtra Clean', 'Strength Juice', 'AA Batteries'],['Mega Box', 'UltraWire', 'MiniReactor', 'PurePipes'],['Mega Box', 'DataCoin', 'Mobile Tracking Unit', '1/4 Inch Steel Beam', 'Cube Of Mass'],['UltraWire', 'PurePipes', 'DataCoin'],['Sundae', 'Cloak Pouch'],['DataCoin', 'Mobile Tracking Unit', 'Cloak Pouch'],['MiniReactor'],['Sticky Fuel', 'Ultra Fertilizer'],['Exxtra Clean', 'MiniReactor', 'Poison+', 'Sundae', 'Strength Juice', 'Salt Water', 'Large Waterskin (Pre-Filled)'],['Strength Juice'],['Salt Water'],['Poison+'],['Sticky Fuel', 'Ultra Fertilizer', 'Mobile Tracking Unit', '1/4 Inch Steel Beam'],['Exxtra Clean', 'Ultra Fertilizer', 'Strength Juice', 'Cloak Pouch', 'MegaCoat'],['Sundae'],['UltraWire', 'DataCoin', 'AA Batteries', 'MegaCoat', 'Large Waterskin (Pre-Filled)'],['Sticky Fuel', 'Sundae', 'Extra Strength Peanuts']]
var ingredient_prices=[480, 355, 550, 425, 525, 585, 635, 620, 685, 415, 460, 650, 605, 435, 430, 790, 330, 505, 690, 335]
var ingredient_descriptions=["Ethically sourced from free range powerlines, spent bullets, and recycled phones."
,"For a special occasion, or hunting that suspiciously pale neighbor."
,"Smells like eggs. Is not eggs. Do not consume."
,"WARNING: DO NOT MIX WITH CONVENTIONAL CLEANING LIQUIDS. WEAR PERSONAL PROTECTIVE EQUIPMENT WHEN HANDLING."
,'Sourced by: Brother Sons Mining Collective "We pride ourselves on hiring everyone who comes through our door looking for an opportunity".'
,"Every gram authenticated by our Fae experts."
,"No bears were harmed in the sourcing of this product."
,"The Food Authority advises against consuming Cinnamon by the spoonful."
,"No Ruby's were harmed in the making of this item."
,"Gieger Counter Not Included."
,"Legally distinct from breathable air."
,"Sourced from the purest mountain springs in miles away from civilization."
,"Shipped in packs of 16 cubes."
,"Usable in Alchemy and Cuisine. We recommend using it on Ration Packs to give them a little extra kick."
,"If experiencing Diarrhea, Nausea, Coughing, Bleeding Gums please call your local medical service hotline."
,"When subjected to large amounts of pressure Coal turns into Diamonds. Try it yourself with DiTechs new Extra Strength Hydraulic Press."
,"Sourced from unidentified individuals."
,"Mrs. Banana thanks you for your continued cooperation and patience while riots are quelled in key growing locations."
,"Comes in sizes Small Medium Large and Extra Large."
,"All styrofoam sourced from recycled packaging."]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 20:
		var ingredient_instance = ingredient_scene.instantiate()
		var ingredientLabel=ingredient_instance.get_node("Ingredient Title")
		var costLabel=ingredient_instance.get_node("Cost Num")
		ingredientLabel.text=ingredient_names[i]
		costLabel.text=str(ingredient_prices[i])
		ingredient_instance.get_node("TextureRect").texture=load(ingredient_pics[i])
		ingredient_instance.set_meta("IngredientDescription",ingredient_descriptions[i])
		ingredient_instance.set_meta("Price",ingredient_prices[i])
		ingredient_instance.set_meta("PicPath",ingredient_pics[i])
		ingredient_instance.set_meta("RecipeList",ingredient_recipes[i])
		vBox.add_child(ingredient_instance)

func _restock():
	for child in vBox.get_children():
		var childStock = child.get_meta("Stock")
		childStock += randi_range(-2,2)
		child.set_meta("Stock",childStock)
		var price = child.get_meta("Price")
		price+=randi_range(-(price-price/2),(price-price/2))
		child.set_meta("Price",price)
