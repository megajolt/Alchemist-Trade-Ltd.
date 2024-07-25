extends Control

@onready var descriptionNode = $"/root/Node3D/Camera3D/LibraryUi/Recipe Info"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var recipeTitle = descriptionNode.get_node("Recipe Name")
	var recipeTime=descriptionNode.get_node("Time")
	var recipeDescription=descriptionNode.get_node("Recipe Description")
	recipeTitle.text=$"Recipe Title".text
	recipeTime.text=str(get_meta("TimeHour"))+":"+str(get_meta("TimeMin"))+":"+str(get_meta("TimeSec"))
	recipeDescription.text=get_meta("recipeDescription")
