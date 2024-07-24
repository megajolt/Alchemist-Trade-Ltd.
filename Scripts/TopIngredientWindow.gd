extends Panel

var textureRect3
var textureRect4

var itemNames
func _ready():
	textureRect3=$/root/Node3D/Camera3D/SynthesizerUi/TextureRect3
	textureRect4=$/root/Node3D/Camera3D/SynthesizerUi/TextureRect4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	itemNames=get_meta("IngredientList")


func _on_item_list_item_selected(index):
	if(textureRect3.get_node("Button3").disabled||textureRect4.get_node("Button4").disabled):
		var itemIcon=$ItemList.get_item_icon(index)
		$ItemList.deselect_all()
		set_meta("ItemImageData",itemIcon)
		set_meta("SelectedItemName",itemNames[index])
