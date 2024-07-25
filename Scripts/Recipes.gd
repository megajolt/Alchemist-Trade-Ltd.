extends Panel


@onready var scrollPanel = self
@onready var vBox = $ScrollContainer/VBoxContainer
@onready var time_hours=get_meta("RecipeHour")
@onready var time_minutes=get_meta("RecipeMin")
@onready var time_seconds=get_meta("RecipeSec")

var recipe_scene = preload("res://Scenes/LibraryItem.tscn")
var recipe_names = ["Mega Box","UltraWire","Exxtra Clean","Sticky Fuel","MiniReactor","Ultra Fertilizer","Poison+","PurePipes","DataCoin","Sundae","Extra Strength Peanuts","Strength Juice","Mobile Tracking Unit","AA Batteries","MegaCoat","Cloak Pouch","1/4 Inch Steel Beam","Salt Water","Large Waterskin (Pre-Filled)","Cube Of Mass"]
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
var recipe_ingredients=[["Copper","Silver","Platinum","Iron"],["Gold","Platinum","Tires",""],["Chlorine","Water","Bone Dust",""],["Coal","Styrofoam","Oxygen","Sulfur"],["Uranium","Platinum","Water",""],["Sulfur","Oxygen","Bone Dust","Coal"],["Chlorine","Mercury","Water",""],["Gold","Platinum","Copper",""],["Ruby Dust","Gold","Tires","Iron"],["Bananas","Cinnamon","Styrofoam","Water"],["Styrofoam","Rubber","",""],["Water","Hydrogen","Chlorine","Bone Dust"],["Ruby Dust","Iron","Coal","Copper"],["Copper","Tires","Chlorine",""],["Tires","Tires","Bone Dust",""],["Ruby Dust","Bone Dust","Cinnamon","Sulfur"],["Coal","Iron","Iron","Coal"],["Salt","Water","",""],["Water","Water","Tires","Tires"],["Iron","Iron","Iron","Iron"]]


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 20:
		var recipe_instance = recipe_scene.instantiate()
		var recipeLabel=recipe_instance.get_node("Recipe Title")
		var timeLabel = recipe_instance.get_node("Time Num")
		recipeLabel.text=recipe_names[i]
		timeLabel.text=str(time_hours[i])+":"+str(time_minutes[i])+":"+str(time_seconds[i])
		recipe_instance.set_meta("recipeDescription",recipe_descriptions[i])
		recipe_instance.set_meta("TimeHour",time_hours[i])
		recipe_instance.set_meta("TimeMin",time_minutes[i])
		recipe_instance.set_meta("TimeSec",time_seconds[i])
		vBox.add_child(recipe_instance)
		print("Added recipe instance:", i + 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
